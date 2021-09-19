//
//  ChallengeGallery.swift
//  canEco
//
//  Created by Marco Zulian on 06/09/21.
//

import UIKit

final class Challenges {
    static private let challenges: [Challenge] =
        [// Esse daqui vai na lista
            
            StepChallenge(name: "Comece a separar o lixo",
                         category: .waste,
                          benefits: [.waste, .polution, .co2],
                          steps: [
                           ("Separar orgânico do reciclável", "Cascas de frutas, resíduos animais ou vegetais e gorduras são orgânicos. Recicláveis são matéria-prima.", false),
                           ("Recicláveis de Metal", "Separe latas, lacres, pregos e afins. Lave antes de descartar.", false),
                           ("Recicláveis de Papel", "Jornal, revistas, cadernos. Certifique-se que não tem gordura (caixa de pizza por exemplo).", false),
                           ("Recicláveis de plástico", "Sacos, garrafa pet, tampas e embalagens. Lave antes de descartar.", false),
                           ("Recicláveis de Vidro", "Garrafas ou potes e vidro. Lave antes de descartar.", false),
                           ("Demais itens", "Pilhas, baterias e isopor são itens com coleta especial.", false),
                           ("Verificar data de coleta", "Cidades tem regras de coleta diferentes. Verifique no site de sua cidade ou com vizinhos.", false),
                           ("Deixar para ser coletado", "Tudo pronto e embalado? Então você começou a separar o lixo!", false)
                         ],
                         imageName: "waste-sorting",
                          shortDescription: "Essa atitude simples e diária facilita o trabalho para a coleta seletiva.",
                          tip: "Separe um tempo no seu dia para fazer a separação do lixo e já deixe um espaço apenas para lixo orgânico.",
                          imageType: .any),

               StepChallenge(name: "Reutilize seu lixo",
                            category: .waste,
                             benefits: [.waste, .polution, .co2],
                             steps: [
                              ("Verifique os itens de metal ou plástico", "Estes itens são mais fáceis de serem reutilizados.", false),
                              ("Ideias de reuso", "Você pode fazer um vaso ou utilizar potes para armazenar itens.", false)
                            ],
                            imageName: "waste-reuse",
                             shortDescription: "Um vaso de plantas, um sapato como peso de porta. Reutilizar para não descartar.",
                            tip: "Qualquer item de metal, plástico ou vidro pode ser reutilizado desde que bem higienizado.",
                            imageType: .any),

               StepChallenge(name: "Faça uma composteira",
                            category: .waste,
                             benefits: [.waste, .polution, .co2],
                             steps: [
                              ("Comprar caixas para composteira", "Compre 3 caixas de 15 litros para composteira.", false),
                              ("Comprar kit de minhoca e humus", "Você precisa comprar 100 minhocas e humus de minhoca.", false),
                               ("Comprar torneira", "Você precisará de uma torneira para retirada de chorume.", false),
                               ("Montagem da composteira", "Você deve furar o fundo da caixa 1 e 2, para a passagem do chorume.", false),
                               ("Montagem da composteira", "Você deve colocar a torneira na caixa três, para a retirada do chorume.", false),
                               ("Montagem da composteira", "Você deve adicionar o humus e as minhocas na caixa de número 2.", false),
                               ("Montagem da composteira", "Empilhe as caixas. Adicione humus na caixa 1 e comece a compostar seus alimentos.", false)
                            ],
                            imageName: "waste-composter",
                             shortDescription: "A composteira ajuda a reduzir seu lixo e emissões de gases do efeito estufa.",
                            tip: "Verifique quantas pessoas tem na sua casa, para saber a litragem adequada da sua composteira. E separe um espaço na sua casa para construir essa composteira.",
                            imageType: .any),

               StepChallenge(name: "Doe roupas",
                            category: .fashion,
                             benefits: [.water, .polution, .co2],
                             steps: [
                              ("Separe as roupas", "Separe peças que você não usa mais e que estejam em boa qualidade.", false),
                              ("Leve até um ponto de doação", "Mercados e até a prefeitura de sua cidade podem aceitar suas peças.", false)
                            ],
                            imageName: "fashion-donating",
                             shortDescription: "Ao doar peças de roupa você ajuda outras pessoas.",
                            tip: "Você pode separar semestralmente peças de roupa para doação.",
                            imageType: .any),

               StepChallenge(name: "Troque roupas em brechó",
                            category: .fashion,
                             benefits: [.water, .waste, .co2],
                             steps: [
                              ("Separe as roupas", "Separe peças que você não usa mais e que estejam em boa qualidade.", false),
                              ("Procure brechós", "Nem todos os brechós realizam trocas.", false),
                               ("Realize a troca", "Negocie com o vendedor do brechó para efetuar a troca.", false),
                               ("Curta sua roupa nova", "Aproveite sua nova peça de roupa em uma ocasião especial.", false)
                            ],
                            imageName: "fashion-thrifting",
                             shortDescription: "Ao trocar peças no brechó você renova seu guarda roupa.",
                            tip: "Você pode realizar trocas bimestralmente para renovar seu guarda roupas.",
                            imageType: .any),

               StepChallenge(name: "Faça upcycling de uma peça",
                            category: .fashion,
                             benefits: [.water, .energy, .co2],
                             steps: [
                              ("Separe a peça de roupa", "Escolha uma peça que você gostaria de personalizar", false),
                              ("Separe os itens", "Tesoura, Lantejoula, cola, fios entre outros podem ser usados.", false),
                               ("Personalize", "Uma camiseta virando cropped ou calça virando shorts - faça você mesmo.", false),
                               ("Curta sua roupa nova!", "Aproveite sua nova peça de roupa em uma ocasião especial.", false),
                            ],
                            imageName: "fashion-upcycling",
                             shortDescription: "Upcycling pode ser uma oportunidade de experimentação artística.",
                            tip: "Você pode iniciar upcycling em peças que já tem um pequeno defeito, para arrumar ela ou até mudar o tipo da peça.",
                            imageType: .any),
               
               StepChallenge(name: "Vegetariano por uma semana",
                            category: .food,
                             benefits: [.co2 , .diseases, .water],
                             steps: [
                              ("Prepare sua dispensa", "Compre legumes e vegetais para a semana. ", false),
                              ("Alimentos pré-prontos", "Compre itens congelados para facilitar nos dias de pouca energia para cozinhar", false),
                               ("Evite alimentos de origem animal", "Substitua a proteina diária por alimentos como tofu, lentilha e outros.", false),
                               ("Comece o dia com um café da manhã", "Reforce usando pasta de amendoim para ter energia.", false),
                            ],
                            imageName: "food-meals",
                             shortDescription: "Por uma semana consumir apenas produtos sem origem animal.",
                            tip: "O ideal é preparar suas refeições e adequar durante a semana. Não se sinta pressionado, pode começar pela segunda sem carne.",
                            imageType: .cow),

               
               //Esse daqui é o que vai sussi

               RepeatableChallenge(name: "Use ecobags",
                                   category: .shopping,
                                   benefits: [.waste, .diseases, .polution],
                                   totalSteps: 1,
                                   imageName: "consumption-ecobag",
                                   shortDescription: "Essa atitude ajudará na redução do uso de plásticos.",
                                   tip: "Você pode deixar a ecobag próximo da saída de sua casa - e dessa forma não esquecerá de utilizar ela.",
                                   imageType: .any),
               
               RepeatableChallenge(name: "Compre a granel",
                                   category: .shopping,
                                   benefits: [.waste, .diseases, .polution],
                                   totalSteps: 1,
                                   imageName: "consumption-bulk",
                                   shortDescription: "Comprando a granel você tem alimentos frescos.",
                                   tip: "Procure locais próximos de sua casa para se tornar parte do seu dia a dia",
                                   imageType: .any),
               
               RepeatableChallenge(name: "Use produtos em barra",
                                   category: .shopping,
                                   benefits: [.waste, .polution, .co2],
                                   totalSteps: 1,
                                   imageName: "consumption-bar",
                                   shortDescription: "Substitua produtos de higiene e limpeza.",
                                   tip: "Você pode começar utilizando sabão de coco no lugar do detergente ou shampoo.",
                                   imageType: .any),
               
               RepeatableChallenge(name: "Segunda-feira sem carro",
                                   category: .transportation,
                                   benefits: [.diseases, .polution, .co2],
                                   totalSteps: 1,
                                   imageName: "mobility-monday",
                                   shortDescription: "Deixe de usar carro um dia da semana.",
                                   tip: "Convide amigos para realizar essa atividade e dessa forma vocês podem revezar em quem está sem carro.",
                                   imageType: .bike),
               
               RepeatableChallenge(name: "Vá de ônibus",
                                   category: .transportation,
                                   benefits: [.diseases, .polution, .co2],
                                   totalSteps: 1,
                                   imageName: "mobility-collective",
                                   shortDescription: "Use o transporte coletivo para diminuir o fluxo de carros.",
                                   tip: "Verifique a diferença de tempo na locomoção entre carro e o transporte coletivo para não ter problemas de atraso em compromissos.",
                                   imageType: .bike),
               
               RepeatableChallenge(name: "Vá de bike ao trabalho",
                                   category: .transportation,
                                   benefits: [.diseases, .polution, .co2],
                                   totalSteps: 1,
                                   imageName: "mobility-bike",
                                   shortDescription: "Use bike e cuide da saúde coletiva de sua cidade.",
                                   tip: "Verifique se sua empresa tem local para banhos e se o transporte até lá contém faixas de ciclovia.",
                                   imageType: .bike),
               
               RepeatableChallenge(name: "Não consuma fast-food",
                                   category: .food,
                                   benefits: [.diseases, .polution, .water],
                                   totalSteps: 1,
                                   imageName: "food-fastfood",
                                   shortDescription: "Que tal cozinhar e pular o fast-food do dia?",
                                   tip: "O ciclo de pedido de comidas pode ser 3x mais custosos do que cozinhar aquela refeição caseira que só você sabe fazer.",
                                   imageType: .cow),
               
               RepeatableChallenge(name: "Segunda-feira sem carne",
                                   category: .food,
                                   benefits: [.diseases, .co2, .water],
                                   totalSteps: 4,
                                   imageName: "food-monday",
                                   shortDescription: "O dia todo sem ingerir alimentos de origem animal.",
                                   tip: "A segunda sem carne pode ser um passo para descobrir uma alimentação diferente.",
                                   imageType: .cow)
    
        ]
    
    static func getChallenges() -> [Challenge] {
        return challenges.filter {
            for ch in User.shared.ongoingChallenges {
                if ch.name == $0.name {
                    return false
                }
            }
            return true
        }
    }
}
