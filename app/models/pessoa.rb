class Pessoa < ApplicationRecord
  has_many :enderecos, dependent: :destroy
  has_many :telefones, dependent: :destroy
  has_many :emails, dependent: :destroy
  validates :nomecompletoourazaosocial, presence: true, length: { minimum: 5 }
  validates :cpfoucnpj, presence:true, length: { minimum: 11, maximum: 14 }
end
