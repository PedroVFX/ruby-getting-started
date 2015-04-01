FactoryGirl.define do
  factory :user do
    #"sequence(:name)  { |n| "Person #{n}" }
    #sequence(:email) { |n| "person_#{n}@example.com"}
    #password "foobar"
    #password_confirmation "foobar"


    name "user1"
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :texto_lancamento do
    #nome "Lorem #{n} melhorir"
    sequence(:nome)  { |n| "Texto lancamento numero: #{n}" }
    sequence(:descricao) { |n| "#{n} Toto para Lorem o lancamento se o para o lancamento se o para o lancamento se o para o lancamento se o para o lancamento se o para o lancamento se o para o lancamento toto se o para o lancamento se o para o lancamento se o para o lancamento se o para o lancamento se o para o lancamento se o para o lancamento se o para o lancamento se o para o lancamento se o para o lancamento se o para o lancamento se o para o lancamento se o para o lancamento se o para o lancamento se o para o lancamento se o para o lancamento se o para o lancamento se o para o lancamento se o para o lancamento se o para o lancamento se o para o lancamento se o para o lancamento se o para o lancamento se o para o lancamento se o para o lancamento se o para o lancamento se o para o lancamento se o para o lancamento se o para o lancamento se o para o lancamento se o para o lancamento se o para o lancamento se o para o lancamento se o para o lancamento se o para o lancamento " }
  end

  factory :soundcloud_item do
    item "SSSSS"
    nome "SSSSS Lorem ipsum soundcloud"
    descricao "SSSS toto"
    url_share "/toto/S"
  end

  factory :vimeo_item do
    item "VVVVVV"
    nome "VVVV Lorem ipsum vimeo"
    descricao "VV toto"
    code_share "/toto/VVV"
  end

  factory :participacao do
    dialog "MyString"
    titulo "MyString"
    imagem "MyString"
    texto "MyText"
    nota "MyText"
  end

  factory :youtube_item do
    item "YYYY"
    nome "YYY Lorem ipsum youtube"
    descricao "YYYY toto"
  end
end
