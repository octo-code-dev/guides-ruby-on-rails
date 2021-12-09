$(document).ready(function() {

    function limpa_formulario_cep() {
        // Limpa valores do formulário de cep.
        $("#endereco_logradouro").val("");
        $("#endereco_bairro").val("");
        $("#endereco_municipio").val("");
        $("#endereco_estado").val("");
        $("#endereco_pais").val("");
    }
    
    //Quando o campo cep perde o foco.
    $("#endereco_cep").blur(function() {

        //Nova variável "cep" somente com dígitos.
        var cep = $(this).val().replace(/\D/g, '');

        //Verifica se campo cep possui valor informado.
        if (cep != "") {

            //Expressão regular para validar o CEP.
            var validacep = /^[0-9]{8}$/;

            //Valida o formato do CEP.
            if(validacep.test(cep)) {

                //Preenche os campos com "..." enquanto consulta webservice.
                $("#endereco_logradouro").val("...");
                $("#endereco_bairro").val("...");
                $("#endereco_municipio").val("...");
                $("#endereco_estado").val("...");
                $("#endereco_pais").val("...");

                //Consulta o webservice viacep.com.br/
                $.getJSON("https://viacep.com.br/ws/"+ cep +"/json/?callback=?", function(dados) {

                    if (!("erro" in dados)) {
                        //Atualiza os campos com os valores da consulta.
                        $("#endereco_logradouro").val(dados.logradouro);
                        $("#endereco_bairro").val(dados.bairro);
                        $("#endereco_municipio").val(dados.localidade);
                        $("#endereco_estado").val(dados.uf);
                        $("#endereco_pais").val("Brasil");
                    } //end if.
                    else {
                        //CEP pesquisado não foi encontrado.
                        limpa_formulario_cep();
                        alert("CEP não encontrado.");
                    }
                });
            } //end if.
            else {
                //cep é inválido.
                limpa_formulario_cep();
                alert("Formato de CEP inválido.");
            }
        } //end if.
        else {
            //cep sem valor, limpa formulário.
            limpa_formulario_cep();
        }
    });
});