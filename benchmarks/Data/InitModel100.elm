module Data.InitModel100 exposing (model)

import Types exposing (Model)
import Math.Vector2 as V2 exposing (Vec2)


{-| Random model for benchmarking
To generate this:

  - Comment out subscriptions list from State.elm and replace with []
  - Insert a Debug.log into update case for Init
  - Run the app in a browser
  - Copy/paste initial model into this file
  - Find & replace things to make it valid

-}
model : Model
model =
    ({ mouse = V2.fromTuple ( 0, 0 )
     , boids =
        [ { position = V2.fromTuple ( -379.6455993652344, -32.86314010620117 ), velocity = V2.fromTuple ( -0.26781558990478516, 0.11870884895324707 ) }
        , { position = V2.fromTuple ( -56.3757438659668, -329.5760192871094 ), velocity = V2.fromTuple ( 0.43569087982177734, 0.34453248977661133 ) }
        , { position = V2.fromTuple ( 18.2645320892334, -337.6326599121094 ), velocity = V2.fromTuple ( -0.14257264137268066, 0.30587124824523926 ) }
        , { position = V2.fromTuple ( 130.99026489257813, 135.894775390625 ), velocity = V2.fromTuple ( -0.3139951229095459, 0.38833165168762207 ) }
        , { position = V2.fromTuple ( 372.20526123046875, 312.4175109863281 ), velocity = V2.fromTuple ( 0.39731526374816895, 0.051479339599609375 ) }
        , { position = V2.fromTuple ( 335.91510009765625, 44.307708740234375 ), velocity = V2.fromTuple ( -0.2907538414001465, -0.46465563774108887 ) }
        , { position = V2.fromTuple ( 369.9965515136719, 459.16558837890625 ), velocity = V2.fromTuple ( 0.46137022972106934, -0.003168821334838867 ) }
        , { position = V2.fromTuple ( -186.96331787109375, 342.55169677734375 ), velocity = V2.fromTuple ( -0.4179039001464844, 0.16970562934875488 ) }
        , { position = V2.fromTuple ( 499.3679504394531, 264.8503723144531 ), velocity = V2.fromTuple ( -0.3543124198913574, -0.46460795402526855 ) }
        , { position = V2.fromTuple ( -158.55670166015625, -424.7527160644531 ), velocity = V2.fromTuple ( -0.433441162109375, 0.4215216636657715 ) }
        , { position = V2.fromTuple ( -347.52392578125, 11.896848678588867 ), velocity = V2.fromTuple ( 0.41213512420654297, -0.43251895904541016 ) }
        , { position = V2.fromTuple ( 465.21258544921875, -21.203041076660156 ), velocity = V2.fromTuple ( -0.35330700874328613, -0.17019939422607422 ) }
        , { position = V2.fromTuple ( -49.96919631958008, 386.708251953125 ), velocity = V2.fromTuple ( 0.28073620796203613, 0.00013494491577148438 ) }
        , { position = V2.fromTuple ( 240.9279327392578, 495.3973388671875 ), velocity = V2.fromTuple ( 0.0572965145111084, 0.019757747650146484 ) }
        , { position = V2.fromTuple ( 52.86097717285156, -466.77374267578125 ), velocity = V2.fromTuple ( 0.28282785415649414, -0.34981656074523926 ) }
        , { position = V2.fromTuple ( 62.96324920654297, 478.86871337890625 ), velocity = V2.fromTuple ( -0.39634060859680176, -0.40750551223754883 ) }
        , { position = V2.fromTuple ( -22.912263870239258, -24.018049240112305 ), velocity = V2.fromTuple ( -0.34612417221069336, -0.3673384189605713 ) }
        , { position = V2.fromTuple ( 129.44602966308594, 160.1612548828125 ), velocity = V2.fromTuple ( 0.2819819450378418, -0.31018829345703125 ) }
        , { position = V2.fromTuple ( 303.7357482910156, -257.5116271972656 ), velocity = V2.fromTuple ( -0.048299312591552734, -0.21897411346435547 ) }
        , { position = V2.fromTuple ( -353.6362609863281, -346.862548828125 ), velocity = V2.fromTuple ( -0.4313852787017822, -0.16226863861083984 ) }
        , { position = V2.fromTuple ( 159.55877685546875, -473.9422912597656 ), velocity = V2.fromTuple ( 0.09467339515686035, -0.22271513938903809 ) }
        , { position = V2.fromTuple ( -180.907958984375, 281.1124267578125 ), velocity = V2.fromTuple ( -0.30208826065063477, -0.008515119552612305 ) }
        , { position = V2.fromTuple ( -63.812496185302734, 106.57930755615234 ), velocity = V2.fromTuple ( -0.13992905616760254, 0.29796528816223145 ) }
        , { position = V2.fromTuple ( 90.31391143798828, 362.5555114746094 ), velocity = V2.fromTuple ( 0.2742934226989746, 0.038466453552246094 ) }
        , { position = V2.fromTuple ( 473.235595703125, -319.2591552734375 ), velocity = V2.fromTuple ( -0.46087169647216797, 0.06360530853271484 ) }
        , { position = V2.fromTuple ( 176.87750244140625, -110.11743927001953 ), velocity = V2.fromTuple ( 0.14662694931030273, 0.14129161834716797 ) }
        , { position = V2.fromTuple ( -151.02601623535156, -423.7332458496094 ), velocity = V2.fromTuple ( -0.4259297847747803, -0.27701544761657715 ) }
        , { position = V2.fromTuple ( 462.3343811035156, -226.72152709960938 ), velocity = V2.fromTuple ( -0.2700672149658203, -0.24720549583435059 ) }
        , { position = V2.fromTuple ( 345.81805419921875, 110.53538513183594 ), velocity = V2.fromTuple ( 0.13498830795288086, 0.0921022891998291 ) }
        , { position = V2.fromTuple ( 101.89437866210938, 373.3575439453125 ), velocity = V2.fromTuple ( -0.29262399673461914, 0.3051738739013672 ) }
        , { position = V2.fromTuple ( -273.76007080078125, -15.22684097290039 ), velocity = V2.fromTuple ( -0.4585084915161133, -0.35119175910949707 ) }
        , { position = V2.fromTuple ( -340.7151794433594, 375.2553405761719 ), velocity = V2.fromTuple ( -0.2385411262512207, 0.05330777168273926 ) }
        , { position = V2.fromTuple ( -423.66339111328125, 181.38504028320313 ), velocity = V2.fromTuple ( -0.27796101570129395, -0.25280070304870605 ) }
        , { position = V2.fromTuple ( -496.35626220703125, -153.82528686523438 ), velocity = V2.fromTuple ( -0.3967556953430176, -0.3023667335510254 ) }
        , { position = V2.fromTuple ( -335.33477783203125, 27.8472900390625 ), velocity = V2.fromTuple ( 0.388211727142334, -0.4572324752807617 ) }
        , { position = V2.fromTuple ( 317.9931640625, -483.052490234375 ), velocity = V2.fromTuple ( 0.406322717666626, 0.09288907051086426 ) }
        , { position = V2.fromTuple ( 193.2802276611328, -7.283449172973633 ), velocity = V2.fromTuple ( 0.002248048782348633, -0.08855247497558594 ) }
        , { position = V2.fromTuple ( -92.5648193359375, -287.7469177246094 ), velocity = V2.fromTuple ( -0.455033540725708, 0.1440880298614502 ) }
        , { position = V2.fromTuple ( -482.9718933105469, -458.6431884765625 ), velocity = V2.fromTuple ( -0.21207141876220703, -0.4736950397491455 ) }
        , { position = V2.fromTuple ( 63.264610290527344, 485.3052978515625 ), velocity = V2.fromTuple ( -0.17039227485656738, -0.05090069770812988 ) }
        , { position = V2.fromTuple ( 242.79403686523438, 232.24639892578125 ), velocity = V2.fromTuple ( 0.18192768096923828, -0.22107481956481934 ) }
        , { position = V2.fromTuple ( -121.67811584472656, 239.3016815185547 ), velocity = V2.fromTuple ( -0.41596102714538574, 0.4448249340057373 ) }
        , { position = V2.fromTuple ( 488.94976806640625, 135.24461364746094 ), velocity = V2.fromTuple ( -0.4099252223968506, 0.40424418449401855 ) }
        , { position = V2.fromTuple ( 217.97442626953125, -167.03868103027344 ), velocity = V2.fromTuple ( -0.27892184257507324, 0.49698638916015625 ) }
        , { position = V2.fromTuple ( 427.6220703125, 496.6943359375 ), velocity = V2.fromTuple ( -0.14460039138793945, 0.4509756565093994 ) }
        , { position = V2.fromTuple ( 453.185546875, 178.171630859375 ), velocity = V2.fromTuple ( 0.4596436023712158, 0.36710357666015625 ) }
        , { position = V2.fromTuple ( -50.82893371582031, -411.6532897949219 ), velocity = V2.fromTuple ( 0.4197120666503906, 0.17612171173095703 ) }
        , { position = V2.fromTuple ( -88.3951187133789, 336.7850646972656 ), velocity = V2.fromTuple ( 0.4870779514312744, -0.27918553352355957 ) }
        , { position = V2.fromTuple ( -39.70790100097656, 120.15128326416016 ), velocity = V2.fromTuple ( 0.24415898323059082, -0.25540661811828613 ) }
        , { position = V2.fromTuple ( -493.5269470214844, -150.706298828125 ), velocity = V2.fromTuple ( -0.2062535285949707, 0.2264242172241211 ) }
        , { position = V2.fromTuple ( -457.590576171875, -114.56131744384766 ), velocity = V2.fromTuple ( -0.32681751251220703, -0.18631505966186523 ) }
        , { position = V2.fromTuple ( 11.114358901977539, 376.3413391113281 ), velocity = V2.fromTuple ( 0.34604597091674805, -0.40966343879699707 ) }
        , { position = V2.fromTuple ( 244.24124145507813, 157.70436096191406 ), velocity = V2.fromTuple ( -0.40642714500427246, 0.06524515151977539 ) }
        , { position = V2.fromTuple ( -368.5853576660156, 435.3854675292969 ), velocity = V2.fromTuple ( 0.0735921859741211, 0.32955121994018555 ) }
        , { position = V2.fromTuple ( 332.8482971191406, 434.0875244140625 ), velocity = V2.fromTuple ( 0.4828603267669678, -0.04198169708251953 ) }
        , { position = V2.fromTuple ( 430.5102844238281, -378.1995849609375 ), velocity = V2.fromTuple ( -0.28106236457824707, 0.312488317489624 ) }
        , { position = V2.fromTuple ( 365.83685302734375, -432.3825988769531 ), velocity = V2.fromTuple ( 0.3717014789581299, -0.17482614517211914 ) }
        , { position = V2.fromTuple ( 368.76678466796875, 163.66696166992188 ), velocity = V2.fromTuple ( 0.11222481727600098, 0.3754236698150635 ) }
        , { position = V2.fromTuple ( 273.06414794921875, -383.5055847167969 ), velocity = V2.fromTuple ( 0.48314666748046875, 0.3645334243774414 ) }
        , { position = V2.fromTuple ( -480.3273620605469, 228.94764709472656 ), velocity = V2.fromTuple ( 0.08894538879394531, -0.1793675422668457 ) }
        , { position = V2.fromTuple ( 417.5431823730469, -184.15379333496094 ), velocity = V2.fromTuple ( -0.1994609832763672, -0.4275703430175781 ) }
        , { position = V2.fromTuple ( 182.39283752441406, 84.01728057861328 ), velocity = V2.fromTuple ( 0.16294193267822266, 0.4955270290374756 ) }
        , { position = V2.fromTuple ( -363.54376220703125, -308.3608093261719 ), velocity = V2.fromTuple ( 0.3877296447753906, -0.32378673553466797 ) }
        , { position = V2.fromTuple ( 90.31510162353516, 40.41337966918945 ), velocity = V2.fromTuple ( 0.08595728874206543, -0.4353921413421631 ) }
        , { position = V2.fromTuple ( -43.71786117553711, 150.20608520507813 ), velocity = V2.fromTuple ( -0.33999180793762207, 0.4186575412750244 ) }
        , { position = V2.fromTuple ( -267.1678161621094, 87.5134506225586 ), velocity = V2.fromTuple ( -0.10002541542053223, -0.19937729835510254 ) }
        , { position = V2.fromTuple ( -232.69700622558594, -376.88470458984375 ), velocity = V2.fromTuple ( -0.18204665184020996, 0.3886089324951172 ) }
        , { position = V2.fromTuple ( -275.7830505371094, -313.20501708984375 ), velocity = V2.fromTuple ( -0.4837608337402344, 0.14094877243041992 ) }
        , { position = V2.fromTuple ( -249.8426513671875, -427.1809997558594 ), velocity = V2.fromTuple ( 0.039430856704711914, 0.49019336700439453 ) }
        , { position = V2.fromTuple ( -421.17523193359375, 262.6130676269531 ), velocity = V2.fromTuple ( 0.39687275886535645, -0.2149360179901123 ) }
        , { position = V2.fromTuple ( -41.3467903137207, 397.70794677734375 ), velocity = V2.fromTuple ( 0.23148488998413086, 0.2849133014678955 ) }
        , { position = V2.fromTuple ( -326.5953063964844, -224.92933654785156 ), velocity = V2.fromTuple ( -0.12519001960754395, 0.30765533447265625 ) }
        , { position = V2.fromTuple ( -73.70758056640625, -128.67832946777344 ), velocity = V2.fromTuple ( -0.29680871963500977, -0.32202577590942383 ) }
        , { position = V2.fromTuple ( 291.6886901855469, -179.26025390625 ), velocity = V2.fromTuple ( 0.40650010108947754, 0.27599620819091797 ) }
        , { position = V2.fromTuple ( -242.93136596679688, -27.767658233642578 ), velocity = V2.fromTuple ( 0.023651599884033203, -0.16449236869812012 ) }
        , { position = V2.fromTuple ( 72.86262512207031, 0.26226043701171875 ), velocity = V2.fromTuple ( -0.4768373966217041, 0.1360163688659668 ) }
        , { position = V2.fromTuple ( -39.30377960205078, -233.62875366210938 ), velocity = V2.fromTuple ( 0.015547513961791992, 0.18109488487243652 ) }
        , { position = V2.fromTuple ( -151.61251831054688, -115.57269287109375 ), velocity = V2.fromTuple ( -0.10255002975463867, 0.09571123123168945 ) }
        , { position = V2.fromTuple ( -362.3182678222656, 464.0614929199219 ), velocity = V2.fromTuple ( -0.29418420791625977, -0.3177812099456787 ) }
        , { position = V2.fromTuple ( 120.3298568725586, 209.96546936035156 ), velocity = V2.fromTuple ( -0.10192131996154785, 0.12697505950927734 ) }
        , { position = V2.fromTuple ( 341.02655029296875, -373.0988464355469 ), velocity = V2.fromTuple ( -0.3799605369567871, -0.41999244689941406 ) }
        , { position = V2.fromTuple ( 480.0369873046875, 367.27880859375 ), velocity = V2.fromTuple ( -0.13855552673339844, -0.02137136459350586 ) }
        , { position = V2.fromTuple ( 149.08123779296875, -0.8187294006347656 ), velocity = V2.fromTuple ( -0.1830577850341797, 0.07928276062011719 ) }
        , { position = V2.fromTuple ( -8.704185485839844, 110.92185974121094 ), velocity = V2.fromTuple ( -0.20539116859436035, 0.33606529235839844 ) }
        , { position = V2.fromTuple ( -255.625732421875, 57.068824768066406 ), velocity = V2.fromTuple ( 0.26198768615722656, 0.4572436809539795 ) }
        , { position = V2.fromTuple ( 306.1001281738281, -238.0747833251953 ), velocity = V2.fromTuple ( -0.40118932723999023, -0.012260913848876953 ) }
        , { position = V2.fromTuple ( -223.5548553466797, -160.68077087402344 ), velocity = V2.fromTuple ( 0.017010927200317383, 0.3770577907562256 ) }
        , { position = V2.fromTuple ( 135.58006286621094, 397.68267822265625 ), velocity = V2.fromTuple ( 0.4817471504211426, 0.4045588970184326 ) }
        , { position = V2.fromTuple ( -424.6365966796875, 102.78392028808594 ), velocity = V2.fromTuple ( 0.29666733741760254, -0.2794477939605713 ) }
        , { position = V2.fromTuple ( -110.1126708984375, -108.5875015258789 ), velocity = V2.fromTuple ( 0.1329789161682129, 0.0006806850433349609 ) }
        , { position = V2.fromTuple ( 310.5359191894531, 154.39630126953125 ), velocity = V2.fromTuple ( 0.07132601737976074, 0.1544184684753418 ) }
        , { position = V2.fromTuple ( 458.03070068359375, -493.5746154785156 ), velocity = V2.fromTuple ( 0.0323028564453125, 0.1969742774963379 ) }
        , { position = V2.fromTuple ( -340.6765441894531, 458.84417724609375 ), velocity = V2.fromTuple ( -0.07215189933776855, 0.23139619827270508 ) }
        , { position = V2.fromTuple ( -28.072834014892578, 196.01034545898438 ), velocity = V2.fromTuple ( -0.17490458488464355, -0.05592775344848633 ) }
        , { position = V2.fromTuple ( 56.30302429199219, -352.2632141113281 ), velocity = V2.fromTuple ( 0.25888538360595703, -0.4713108539581299 ) }
        , { position = V2.fromTuple ( 332.672119140625, -362.7097473144531 ), velocity = V2.fromTuple ( -0.2765235900878906, -0.10922646522521973 ) }
        , { position = V2.fromTuple ( 83.73999786376953, 168.88356018066406 ), velocity = V2.fromTuple ( -0.24602198600769043, -0.18961787223815918 ) }
        , { position = V2.fromTuple ( 375.2887268066406, -223.98233032226563 ), velocity = V2.fromTuple ( -0.22016692161560059, -0.23110318183898926 ) }
        , { position = V2.fromTuple ( -370.8453063964844, -478.2850646972656 ), velocity = V2.fromTuple ( 0.4482123851776123, 0.015902042388916016 ) }
        , { position = V2.fromTuple ( 88.24372100830078, -486.5076599121094 ), velocity = V2.fromTuple ( -0.43389105796813965, 0.28435587882995605 ) }
        ]
     }
    )
