import Foundation

// swiftlint:disable line_length file_length
var genreListData: Data {
    return """
    {
        "genres": [
            {
                "id": 28,
                "name": "액션"
            },
            {
                "id": 12,
                "name": "모험"
            },
            {
                "id": 16,
                "name": "애니메이션"
            },
            {
                "id": 35,
                "name": "코미디"
            },
            {
                "id": 80,
                "name": "범죄"
            },
            {
                "id": 99,
                "name": "다큐멘터리"
            },
            {
                "id": 18,
                "name": "드라마"
            },
            {
                "id": 10751,
                "name": "가족"
            },
            {
                "id": 14,
                "name": "판타지"
            },
            {
                "id": 36,
                "name": "역사"
            },
            {
                "id": 27,
                "name": "공포"
            },
            {
                "id": 10402,
                "name": "음악"
            },
            {
                "id": 9648,
                "name": "미스터리"
            },
            {
                "id": 10749,
                "name": "로맨스"
            },
            {
                "id": 878,
                "name": "SF"
            },
            {
                "id": 10770,
                "name": "TV 영화"
            },
            {
                "id": 53,
                "name": "스릴러"
            },
            {
                "id": 10752,
                "name": "전쟁"
            },
            {
                "id": 37,
                "name": "서부"
            }
        ]
    }
    """.data(using: .utf8)!
}

var moviePageData: Data {
    return """
    {
        "page": 1,
        "results": [
            {
                "adult": false,
                "backdrop_path": "/1wOu8rdvPxU1ObHi20VcRhfNpbo.jpg",
                "genre_ids": [
                    12,
                    14,
                    28
                ],
                "id": 10195,
                "original_language": "en",
                "original_title": "Thor",
                "overview": "파괴를 일삼는 요툰하임을 제압한 왕 오딘의 통치로 평화로운 나날을 보내고 있는 신의 세계 아스가르드. 오딘의 아들인 토르의 왕위 계승식이 있던 날, 요툰하임의 지배자인 라우페이는 평화 협정을 위반하고 아스가르드를 침입한다. 이 사건으로 왕위에 오르지 못한 토르는 분노와 모욕감에 요툰하임을 공격하지만 막강한 군대에 포위되어 위기에 몰리게 되고, 오딘은 토르의 오만하고 경솔한 행동에 분노해 토르의 신으로서의 능력을 박탈한 채 인간 세계 미스가르드로 추방한다. 한편 천체의 이상현상을 연구하던 과학자 제인 일행은 거대한 섬광의 흔적을 쫓던 중, 그 현장 한가운데서 지구에 떨어진 토르와 맞닥뜨린다.",
                "popularity": 67.68,
                "poster_path": "/f99ngOw3HByxzT85EgUdd7MF8c4.jpg",
                "release_date": "2011-04-21",
                "title": "토르: 천둥의 신",
                "video": false,
                "vote_average": 6.768,
                "vote_count": 19587
            },
            {
                "adult": false,
                "backdrop_path": "/jsoz1HlxczSuTx0mDl2h0lxy36l.jpg",
                "genre_ids": [
                    14,
                    28,
                    35
                ],
                "id": 616037,
                "original_language": "en",
                "original_title": "Thor: Love and Thunder",
                "overview": "이너피스를 위해 자아 찾기 여정을 떠난 천둥의 신 토르. 그러나 우주의 모든 신들을 몰살하려는 신 도살자 고르의 등장으로 토르의 안식년 계획은 산산조각 나 버린다. 토르는새로운 위협에 맞서기 위해 킹 발키리, 코르그, 그리고 전 여자친구 제인과 재회하게 되고, 그녀가 묠니르를 휘두르는 마이티 토르가 되어 나타나 모두를 놀라게 한다. 이제 팀 토르는 고르의 복수에 얽힌 미스터리를 밝히고 더 큰 전쟁을 막기 위한 전 우주적 스케일의 모험을 시작하는데...",
                "popularity": 265.282,
                "poster_path": "/un8ZDtx2SMwNwXRYy65aItnNjab.jpg",
                "release_date": "2022-07-06",
                "title": "토르: 러브 앤 썬더",
                "video": false,
                "vote_average": 6.6,
                "vote_count": 5935
            },
            {
                "adult": false,
                "backdrop_path": "/kaIfm5ryEOwYg8mLbq8HkPuM1Fo.jpg",
                "genre_ids": [
                    28,
                    12,
                    14,
                    878,
                    35
                ],
                "id": 284053,
                "original_language": "en",
                "original_title": "Thor: Ragnarok",
                "overview": "은하계를 탐험하던 토르는 오딘의 오랜 숙적 수르트와의 대결에서 승리하는데, 수르트는 라그나로크가 이미 시작됐고, 막을 수 없을 것이라는 의미심장한 말을 남긴다. 한편 오딘의 힘이 약해지며 그가 봉인했던 죽음의 여신 헬라가 나타난다. 오딘의 첫째딸인 그녀는 두 동생, 토르와 로키를 가볍게 제압하고 아스가르드를 정복한다. 헬라와의 전쟁에서 묠니르를 잃고 사카아르라는 미지의 행성에 불시착한 토르는 아스가르드 행성으로 돌아가기 위해 고군분투한다. 행성의 통치자 그랜드 마스터는 행성 최고의 투사 챔피언과 싸워 이기면 행성을 떠나게 해주겠다고 토르에게 제안한다.",
                "popularity": 67.948,
                "poster_path": "/jwswXltzpGaKZCtz1CiDjXHQYAs.jpg",
                "release_date": "2017-10-24",
                "title": "토르: 라그나로크",
                "video": false,
                "vote_average": 7.599,
                "vote_count": 19066
            },
            {
                "adult": false,
                "backdrop_path": "/4zTsF0RtO0av3YX1NaKDqGKPxYF.jpg",
                "genre_ids": [
                    28,
                    12,
                    14
                ],
                "id": 76338,
                "original_language": "en",
                "original_title": "Thor: The Dark World",
                "overview": "어벤져스의 뉴욕 사건 후, 다시 신들의 고향인 아스가르드 왕국으로 돌아간 토르와 로키. 지구를 위협한 로키는 지하 감옥에 갇히고, 토르는 아버지 오딘과 함께 우주의 질서를 재정립하기 위해 나선다. 1년 후, 지구에 혼자 남은 제인은 우연히 태초부터 존재해왔던 어둠의 종족 다크 엘프의 무기 에테르를 얻게 된다. 이 사실을 안 다크엘프의 리더 말레키스는 에테르를 되찾기 위해 제인과 아스가르드를 공격하고, 토르는 사랑하는 여인 제인과 아스가르드 왕국을 지키기 위해 로키에게 위험한 동맹을 제안하게 된다.",
                "popularity": 59.351,
                "poster_path": "/aKnEwByCjXHpRoyOlSwYfmr9d5D.jpg",
                "release_date": "2013-10-30",
                "title": "토르: 다크 월드",
                "video": false,
                "vote_average": 6.5,
                "vote_count": 15987
            },
            {
                "adult": false,
                "backdrop_path": "/5wzaOqsxuXgErXEusfuE6AWtcNm.jpg",
                "genre_ids": [
                    14,
                    16,
                    878
                ],
                "id": 50388,
                "original_language": "ja",
                "original_title": "いばらの王 -King of Thorn-",
                "overview": "온 몸이 돌처럼 굳어 결국 죽음에 이르게 하는 일명 ‘메두사 바이러스’가 전세계에 퍼졌다. WHO는 긴급 성명을 발표, 각국에 대책과 정보 공개를 요구한다. 이에 최고의 제약회사인 비너스 게이트는 ‘콜드 슬립 프로젝트’를 개발한다. 전세계인 중 메두사 바이러스에 감염된 160명만 선발해 냉동 캡슐에서 100년 동안 잠들게 한 후, 그들을 바이러스가 사라지고 없을 미래에 다시 눈뜨게 하는 것이 이 프로젝트의 핵심이다. 선발된 사람들은 하나 둘씩 스코틀랜드의 어느 성에 마련된 콜드 슬립 센터로 모이기 시작한다. 그리고 그들은 콜드 슬립 상태에 이른다. 얼마나 잠들어 있었던 것일까? 깨어나보니 세상은 온통 가시덤불로 뒤덮여있고, 어디선가 나타난 정체불명의 몬스터들이 사람들을 위협하는데.. 도대체 세상엔 무슨 일이 벌어졌던 것인가? 이제 그 미스터리가 밝혀질 탈출 드라마가 시작된다!",
                "popularity": 17.327,
                "poster_path": "/1uiND6oC3gHTRBAbr8fH65dDZ2n.jpg",
                "release_date": "2010-05-01",
                "title": "가시나무 왕",
                "video": false,
                "vote_average": 6.6,
                "vote_count": 122
            },
            {
                "adult": false,
                "backdrop_path": "/gseVao2FiyRZuqWQNl05BQ8TEVM.jpg",
                "genre_ids": [
                    16,
                    12,
                    10751
                ],
                "id": 14317,
                "original_language": "en",
                "original_title": "The Wild Thornberrys Movie",
                "overview": "아빠, 엄마, 언니 데비, 동생 도니, 그리고 우리의 주인공 엘리자 등 쏜베리 가족은 아프리카의 이곳저곳을 돌아다니며 대자연의 놀라운 모습을 카메라에 담는다. 침팬지 다윈과 함께 종종 사라졌다가 나타나는 엘리자를 가족들은 이상하게 생각하지만 사실 엘리자에겐 굉장한 비밀이 있다. 이 꼬마숙녀는 동물과 말을 할 수 있는 능력이 있다는 것. 동물을 사랑하는 그녀의 착한 품성을 갸륵하게 여긴 아프리카의 주술사로부터 비밀을 지키는 조건으로 능력을 얻은 엘리자. 만약 이 사실을 누군가에게 말하면 능력은 없어지고 만다. 그런 어느 날, 엘리자는 늘 어울리던 치타 가족을 찾아가 새끼 치타들과 경주를 벌인다. 그러나 어미 치타의 경고를 무시하고 너무 멀리까지 간 것이 화근. 새끼 한 마리가 헬리콥터를 타고 추격하는 밀렵꾼들에게 잡혀가고 만다. 엘리자는 목숨을 걸고 새끼를 구하려 했지만 결국 놓쳐버린다. 때마침 가족을 찾아왔던 할머니와 부모님은 이런 엘리자를 염려한 나머지 영국으로 보내기로 결정한다.",
                "popularity": 19.448,
                "poster_path": "/nmWpcUQtWHC4kjVCygiFEDR1wCY.jpg",
                "release_date": "2002-12-20",
                "title": "쏜베리의 가족탐험대 극장판",
                "video": false,
                "vote_average": 6.5,
                "vote_count": 228
            },
            {
                "adult": false,
                "backdrop_path": "/6UwmkaB1mRZ0fo5A79m5XpVA5RK.jpg",
                "genre_ids": [
                    16,
                    12,
                    35,
                    10751,
                    14
                ],
                "id": 106631,
                "original_language": "is",
                "original_title": "Hetjur Valhallar - Þór",
                "overview": "신들의 왕이자 자신의 아버지인 '오딘'에게 인정받고 싶은, 평범한 대장장이 '토르'. 그는 신전에서 지상에 떨어뜨린 마법망치 '크러셔'를 우연히 발견하게 되고, 이후 '크러셔' 에게 훈련을 받으며 차츰 전사로서 성장해간다. 그러던 어느 날, 얼음마녀 '헬'과 거인족이 마을을 덮치고, 그들에게 친구 '에다'가 납치 당하는 사건이 벌어진다. '토르'는 '헬'로 부터 마을을 지키고, 납치된 '에다'를 찾기 위해 '크러셔'와 함께 모험을 떠나는데 ...",
                "popularity": 6.89,
                "poster_path": "/mEXEqd9exkuYMcNc2RMf1PyCyEt.jpg",
                "release_date": "2011-10-14",
                "title": "토르 : 마법망치의 전설",
                "video": false,
                "vote_average": 5.3,
                "vote_count": 45
            },
            {
                "adult": false,
                "backdrop_path": "/1y6dEBTOzCyJRetN9fOtS0H7Vnx.jpg",
                "genre_ids": [
                    28,
                    16,
                    14,
                    878
                ],
                "id": 101907,
                "original_language": "en",
                "original_title": "Hulk vs. Thor",
                "overview": "아스가르드의 오딘이 잠들어있는 동안, 토르를 시기하는 이복형제 로키가 헐크를 통해서 토르를 죽이려고 한다. 토르의 사랑을 받지 못하는 아모르가 로키를 돕는데, 로키가 분노를 조절하지 못하자 그만 헐크가 맘대로 날뛰게 된다. 토르는 배너 박사가 죽자, 그 영혼을 구하러 죽음의 신인 헬라에게 찾아가는데...",
                "popularity": 14.492,
                "poster_path": "/pezTIa0SmmNIhjQWzo63OlBdpLf.jpg",
                "release_date": "2009-01-27",
                "title": "헐크 vs 토르",
                "video": false,
                "vote_average": 6.784,
                "vote_count": 190
            },
            {
                "adult": false,
                "backdrop_path": "/1RwWclnfcAcFG5n1qejtKRQDqE3.jpg",
                "genre_ids": [
                    878,
                    14
                ],
                "id": 76535,
                "original_language": "en",
                "original_title": "Marvel One-Shot: A Funny Thing Happened on the Way to Thor's Hammer",
                "overview": "필 콜슨 요원은 뉴멕시코에서 발생한 기현상을 조사하기 위해 닉 퓨리의 지령을 받고 토니 스타크의 말리부 맨션을 떠나 뉴멕시코로 향한다. 콜슨은 중간에 주유소에 들러 기름을 넣고 딸려있는 편의점에 들어가 설탕가루 입힌 도넛과 초콜릿 도넛 중 어떤 걸 살지를 고민한다.  그 때 갑자기 편의점에 2인조 강도가 들이닥쳐 점원을 총으로 위협하는 상황이 발생하고, 강도들은 점원에게 밖에 있는 자동차는 누구 것이냐고 윽박지른다. 이에 콜슨은 자신의 차라며 깨알같게도 렌트카라고 하고 강도들의 시선을 돌리고, 강도들은 자동차 열쇠를 내놓으라고 지시하는데...",
                "popularity": 12.75,
                "poster_path": "/s1E2JwX798f4ssefszQJDTBMrjb.jpg",
                "release_date": "2011-10-25",
                "title": "마블 원-샷: 토르의 망치를 가지러 가던 길의 기묘한 사건",
                "video": false,
                "vote_average": 6.9,
                "vote_count": 374
            },
            {
                "adult": false,
                "backdrop_path": "/yq1Zr8mCVd0jWpoLO4u9RiUB8K7.jpg",
                "genre_ids": [
                    35,
                    878
                ],
                "id": 413279,
                "original_language": "en",
                "original_title": "Team Thor",
                "overview": "Discover what Thor was up to during the events of Captain America: Civil War.",
                "popularity": 8.707,
                "poster_path": "/jVSmX89BvsQV2z3wh2IVYVNVw1a.jpg",
                "release_date": "2016-08-28",
                "title": "팀 토르",
                "video": false,
                "vote_average": 7.3,
                "vote_count": 477
            },
            {
                "adult": false,
                "backdrop_path": "/oBIn5pHlbmZgr5b8D6WL10rsgO5.jpg",
                "genre_ids": [
                    878,
                    35,
                    14
                ],
                "id": 441829,
                "original_language": "en",
                "original_title": "Team Thor: Part 2",
                "overview": "A continuation of the documentary spoof of what Thor and his roommate Darryl were up to during the events of \\\"Captain America: Civil War\\\". While Cap and Iron Man duke it out, Thor tries to pay Darryl his rent in Asgardian coins.",
                "popularity": 12.086,
                "poster_path": "/9Vt1OLu3BrKy1IQFK3QyzpR1LVm.jpg",
                "release_date": "2017-02-14",
                "title": "팀 토르: 파트 2",
                "video": false,
                "vote_average": 7.0,
                "vote_count": 276
            },
            {
                "adult": false,
                "backdrop_path": "/bOmOKlujruO0fudftYCqxNR6Xd1.jpg",
                "genre_ids": [
                    12,
                    14,
                    10770
                ],
                "id": 63736,
                "original_language": "en",
                "original_title": "Almighty Thor",
                "overview": "악의 신 ‘로키’가 발하라 요새와 숲을 파괴하고 무적의 햄머를 훔쳐 달아났을 때 이를 저지할 수 있는 단 하나의 젊은 영웅. 토르가 등장한다. 토르는 아마겟돈으로부터 지구를 지켜내기 위해 고군분투하는데… ….\\r 현대와 과거를 넘나들고 괴수 크리처가 등장하는 액션 판타지.\\r CG와 특수효과에 총력을 기울인 제작사 어사일럼의 2011년 야심작.",
                "popularity": 7.311,
                "poster_path": "/h001wN1ITWOjbMdE2ROHcAPRUfx.jpg",
                "release_date": "2011-05-07",
                "title": "올마이티 토르",
                "video": false,
                "vote_average": 2.756,
                "vote_count": 43
            },
            {
                "adult": false,
                "backdrop_path": "/gxOhRaUzTuVycC8QvfzQJn4eO9F.jpg",
                "genre_ids": [
                    10770,
                    53,
                    18
                ],
                "id": 333653,
                "original_language": "en",
                "original_title": "If There Be Thorns",
                "overview": "Christopher and Cathy Dollanganger live together as man and wife with Cathy's two sons who are unaware of the incestuous nature of their parents' relationship. But when a mysterious woman moves in next door and befriends the younger boy, Bart, he begins a strange transformation and displays accusatory behavior towards Cathy and Christopher. When Christopher discovers their mysterious neighbor is, in fact, his mother Corrine Dollanganger, all of the family's long-hidden secrets are revealed in a tragic climax.",
                "popularity": 9.516,
                "poster_path": "/jm3CJXE72933KJ6BJ07gZ49MGwO.jpg",
                "release_date": "2015-04-05",
                "title": "이프 데어 비 쏜스",
                "video": false,
                "vote_average": 5.9,
                "vote_count": 100
            },
            {
                "adult": false,
                "backdrop_path": "/99Rd26ceIhonpOP5JoqcXYqnkD.jpg",
                "genre_ids": [
                    18,
                    53
                ],
                "id": 397722,
                "original_language": "en",
                "original_title": "Thoroughbreds",
                "overview": "한때는 절친이었지만 사이가 소원해진 두 소녀. 조심스레 다시 가까워지기 시작한 이들에게 죽도록 꼴 보기 싫은 사람이 생겼다. 있잖아, 우리 이 사람을 어떻게 죽일지 한번 상상해 볼래?",
                "popularity": 11.156,
                "poster_path": "/pIxZzTfITqBpZxbIGsV01DcoHsT.jpg",
                "release_date": "2018-03-09",
                "title": "서러브레드",
                "video": false,
                "vote_average": 6.418,
                "vote_count": 1013
            },
            {
                "adult": false,
                "backdrop_path": "/dXQ1DniisiNMTCNdJUcI4NA04PL.jpg",
                "genre_ids": [
                    99
                ],
                "id": 1015595,
                "original_language": "en",
                "original_title": "Marvel Studios Assembled: The Making of Thor: Love and Thunder",
                "overview": "Settle in with the likes of Taika Waititi, Chris Hemsworth, Natalie Portman, Christian Bale, and Tessa Thompson, and as they divulge the secrets behind the creation of Thor: Love and Thunder. Through in-depth interviews with cast and crew, along with raw, unseen footage from the set and beyond, ASSEMBLED pulls back the curtain on the God of Thunder’s fourth feature film.",
                "popularity": 7.66,
                "poster_path": "/bpYUmBLvpCHT8gq6U5uGL2CwUIA.jpg",
                "release_date": "2022-09-08",
                "title": "Marvel Studios Assembled: The Making of Thor: Love and Thunder",
                "video": false,
                "vote_average": 7.5,
                "vote_count": 26
            },
            {
                "adult": false,
                "backdrop_path": "/rESsefcThUTYAOX5HkRK5nTGGtj.jpg",
                "genre_ids": [
                    14,
                    12,
                    28
                ],
                "id": 183154,
                "original_language": "it",
                "original_title": "Thor il conquistatore",
                "overview": "After both his parents are brutally murdered by his fathers rival Gnut and his men the new born Thor is placed in hiding by the physical embodiment of the god Teisha.  Raised in secret under the guidance of Teisha, Thor comes to maturity and goes on a quest to avenge the death of his parents and return peace to his lands, in the process he discovers a woman to take as his wife, finds and uncovers his fathers sword and masters the art of combat, all under the ever watchful eye of the amorphous Teisha.",
                "popularity": 2.425,
                "poster_path": "/jGvDzNyBJxaK99snuHoDEOqh5hg.jpg",
                "release_date": "1983-02-05",
                "title": "Thor the Conqueror",
                "video": false,
                "vote_average": 3.794,
                "vote_count": 17
            },
            {
                "adult": false,
                "backdrop_path": "/1DkEL3ktujKdbjj7Yh4gscaHC4T.jpg",
                "genre_ids": [
                    28,
                    14
                ],
                "id": 990593,
                "original_language": "en",
                "original_title": "Thor: God of Thunder",
                "overview": "Thor’s villainous brother Loki has escaped Asgard to search for Yggdrasil — The Tree of the Nine Realms. The tree holds the power of the Universe, and is secreted away on Earth. With the help of giant wolf god Fenrir, Loki plans to destroy the tree and replant it in his image, giving him dominion over all. Now Thor must follow Loki to Earth to wage an epic battle that will hold the two worlds in its balance.",
                "popularity": 6.207,
                "poster_path": "/xZngif5riLClwUBYuAp2qyLH6pp.jpg",
                "release_date": "2022-07-08",
                "title": "Thor: God of Thunder",
                "video": false,
                "vote_average": 4.786,
                "vote_count": 14
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    99
                ],
                "id": 448363,
                "original_language": "en",
                "original_title": "Thor: Assembling the Troupe",
                "overview": "A short piece that looks at the casting and subsequent work of Chris Hemsworth, Natalie Portman, and Anthony Hopkins.",
                "popularity": 5.303,
                "poster_path": "/7tgdZEWljiTokgayEmL4SFQuAGu.jpg",
                "release_date": "2011-09-13",
                "title": "Thor: Assembling the Troupe",
                "video": true,
                "vote_average": 7.182,
                "vote_count": 22
            },
            {
                "adult": false,
                "backdrop_path": "/itmHtY4asbET2jTenAsw8xz8F1a.jpg",
                "genre_ids": [],
                "id": 25023,
                "original_language": "en",
                "original_title": "The Thorn Birds: The Missing Years",
                "overview": "",
                "popularity": 4.421,
                "poster_path": "/4mwxAMCUiQDxp66PRtky5AS2wct.jpg",
                "release_date": "1996-01-01",
                "title": "The Thorn Birds: The Missing Years",
                "video": false,
                "vote_average": 6.6,
                "vote_count": 14
            },
            {
                "adult": false,
                "backdrop_path": "/ufekY2p0zR41eAeKDrqpmylDa6K.jpg",
                "genre_ids": [
                    35,
                    10402,
                    10749
                ],
                "id": 32489,
                "original_language": "en",
                "original_title": "Thoroughly Modern Millie",
                "overview": "Millie Dillmount, a fearless young lady fresh from Salina, Kansas, determined to experience Life, sets out to see the world in the rip-roaring Twenties. With high spirits and wearing one of those new high hemlines, she arrives in New York to test the \\\"modern\\\" ideas she had been reading about back in Kansas: \\\"I've taken the girl out of Kansas. Now I have to take Kansas out of the girl!\\\"",
                "popularity": 7.649,
                "poster_path": "/ce8rBGFR0naGsp6mKy9CNKn9iSa.jpg",
                "release_date": "1967-03-22",
                "title": "모던 밀리",
                "video": false,
                "vote_average": 6.9,
                "vote_count": 74
            }
        ],
        "total_pages": 14,
        "total_results": 264
    }
    """.data(using: .utf8)!
}

var tvShowPageData: Data {
    return """
    {
        "page": 1,
        "results": [
            {
                "adult": false,
                "backdrop_path": "/euzOZte7gh2MvocsMbQlv0IoKFI.jpg",
                "genre_ids": [
                    18
                ],
                "id": 203857,
                "origin_country": [
                    "US"
                ],
                "original_language": "en",
                "original_name": "The Diplomat",
                "overview": "국제적인 위기가 닥친 상황에서 영국 대사가 된 외교관. 새롭게 주어진 중요한 업무와 정계 스타와의 순탄치 않은 결혼 생활을 조율해 나가야 한다.",
                "popularity": 44.158,
                "poster_path": "/cOKXV0FalCYixNmZYCfHXgyQ0VX.jpg",
                "first_air_date": "2023-04-20",
                "name": "외교관",
                "vote_average": 7.6,
                "vote_count": 75
            },
            {
                "adult": false,
                "backdrop_path": "/uJEAjS6aBTF3cWIHxscGIfYrDq.jpg",
                "genre_ids": [
                    18
                ],
                "id": 203762,
                "origin_country": [
                    "GB"
                ],
                "original_language": "en",
                "original_name": "The Diplomat",
                "overview": "The six-part series follows Laura Simmonds and her Barcelona Consul colleague and friend Alba Ortiz as they fight to protect British nationals who find themselves in trouble in the Catalan city.",
                "popularity": 11.812,
                "poster_path": "/h4txyCHHEohY3wB9139F5LYdfnZ.jpg",
                "first_air_date": "2023-02-28",
                "name": "The Diplomat",
                "vote_average": 6.333,
                "vote_count": 3
            },
            {
                "adult": false,
                "backdrop_path": "/nQ5l5GhrsxbtWcZaqj3KKRFGLyY.jpg",
                "genre_ids": [],
                "id": 93455,
                "origin_country": [],
                "original_language": "de",
                "original_name": "Die jungen Diplomaten",
                "overview": "We bring the distant star of diplomacy closer and accompany five protagonists of the 2017 year of the \\\"Concours diplomatique\\\" during their training.",
                "popularity": 0.6,
                "poster_path": null,
                "first_air_date": "2019-08-22",
                "name": "The Young Diplomats",
                "vote_average": 0.0,
                "vote_count": 0
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    35
                ],
                "id": 64636,
                "origin_country": [
                    "DE"
                ],
                "original_language": "de",
                "original_name": "Diplomaten küßt man nicht",
                "overview": "",
                "popularity": 0.6,
                "poster_path": null,
                "first_air_date": "1987-08-30",
                "name": "Diplomaten küßt man nicht",
                "vote_average": 0.0,
                "vote_count": 0
            },
            {
                "adult": false,
                "backdrop_path": "/6lJ8JfeY1SjAL10ie2xzmF03TEz.jpg",
                "genre_ids": [
                    18
                ],
                "id": 75446,
                "origin_country": [
                    "DE"
                ],
                "original_language": "de",
                "original_name": "Die Diplomatin",
                "overview": "",
                "popularity": 3.319,
                "poster_path": "/aSzXF4ZOhOgbCjgN9xQAuZFbWr5.jpg",
                "first_air_date": "2016-04-30",
                "name": "Die Diplomatin",
                "vote_average": 4.0,
                "vote_count": 1
            },
            {
                "adult": false,
                "backdrop_path": "/kTcuAfNEht7GUjP0zjlBJ1GYb2m.jpg",
                "genre_ids": [
                    18,
                    9648,
                    80
                ],
                "id": 91430,
                "origin_country": [
                    "JP"
                ],
                "original_language": "ja",
                "original_name": "外交官 黒田康作",
                "overview": "오다 유지 주연으로 2009년에 개봉된 영화 아말피 여신의 보수의 속편에 해당하는 이야기로 사건 해결을 주축으로 외교의 어둠에 날카롭게 돌진해가고 영화에서는 그려지지 않았던 구로다의 과거와 인간 요소가 더해져 압도적인 재미와 손에 땀을 쥐게 하는 전개가 그려진 드라마.",
                "popularity": 4.69,
                "poster_path": "/3wh3MlHqaVDLwfb8v30zfzby72s.jpg",
                "first_air_date": "2011-01-13",
                "name": "외교관 쿠로다 코사쿠",
                "vote_average": 0.0,
                "vote_count": 0
            },
            {
                "adult": false,
                "backdrop_path": "/g50KQTuQU6Vx9QcoZzyR1LTIJS3.jpg",
                "genre_ids": [
                    18
                ],
                "id": 95286,
                "origin_country": [
                    "CN"
                ],
                "original_language": "zh",
                "original_name": "外交风云",
                "overview": "",
                "popularity": 8.34,
                "poster_path": "/sGC6CiOmbZDBzaAXZ7TQHJnDv4e.jpg",
                "first_air_date": "2019-09-19",
                "name": "Diplomatic Situation",
                "vote_average": 8.7,
                "vote_count": 3
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    35
                ],
                "id": 18097,
                "origin_country": [
                    "NZ"
                ],
                "original_language": "en",
                "original_name": "Diplomatic Immunity",
                "overview": "Diplomatic Immunity is a New Zealand comedy that follows the misadventures at the consulate of The Most Royal Kingdom of Feausi and a fallen New Zealand Foreign Affairs high-flier who has been sent in to straighten out the consulate staff. The show screened in New Zealand on TV1, every Tuesday night at 10:00.",
                "popularity": 0.6,
                "poster_path": "/rh0uXnKVMxLaHjAwufM0UrrZIQU.jpg",
                "first_air_date": "2009-03-10",
                "name": "Diplomatic Immunity",
                "vote_average": 0.0,
                "vote_count": 0
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [],
                "id": 33696,
                "origin_country": [],
                "original_language": "en",
                "original_name": "Diplomatic Passport",
                "overview": "Diplomatic Passport is a Canadian interview television series which aired on CBC Television from 1961 to 1962.",
                "popularity": 0.6,
                "poster_path": null,
                "first_air_date": "",
                "name": "Diplomatic Passport",
                "vote_average": 0.0,
                "vote_count": 0
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    10763
                ],
                "id": 12420,
                "origin_country": [
                    "CA"
                ],
                "original_language": "en",
                "original_name": "Diplomatic Immunity",
                "overview": "Diplomatic Immunity was a weekly political analysis and debate television show on TVOntario, which ran until 2006. Issues discussed reflected contemporary concerns; recently, these included terrorism, Middle East affairs, and US politics, though potentially any issue of international significance was considered.\\n\\nIt was hosted by Steve Paikin, and featured regular guests and invited analysts. Regular guests included:\\n\\n⁕Janice Stein, Director of the Munk Centre for International Studies at the University of Toronto.\\n\\n⁕Patrick Martin, a columnist and editor at the Globe and Mail\\n\\n⁕Richard Gwyn, a columnist at the Toronto Star\\n\\n⁕Lewis MacKenzie, a retired Major-General of the Canadian Forces\\n\\n⁕Eric Margolis, a columnist at the Toronto Sun and the Huffington Post\\n\\nInvited analysts were typically experts in the field of discussion; they were sourced from academia, politics and the business community alike.\\n\\nThe show aired on Friday nights at 11PM, and Sundays at 3PM and 11PM. It was cancelled at the same time as the nightly newsmagazine Studio 2. The new series The Agenda incorporated elements of both shows.",
                "popularity": 0.6,
                "poster_path": null,
                "first_air_date": "",
                "name": "Diplomatic Immunity",
                "vote_average": 0.0,
                "vote_count": 0
            },
            {
                "adult": false,
                "backdrop_path": "/uuyB6e2bGPDQiTnLBmC11ltdvHF.jpg",
                "genre_ids": [
                    99
                ],
                "id": 152493,
                "origin_country": [
                    "DK"
                ],
                "original_language": "da",
                "original_name": "Diplomaterne",
                "overview": "",
                "popularity": 0.6,
                "poster_path": "/277loLhjQYt3zH2FK1Q3DmB66if.jpg",
                "first_air_date": "2021-11-15",
                "name": "Diplomaterne",
                "vote_average": 1.0,
                "vote_count": 1
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [],
                "id": 17758,
                "origin_country": [],
                "original_language": "en",
                "original_name": "Diplomatic License",
                "overview": "Diplomatic License was a weekly CNN International news program covering the United Nations which ran from 1994 to 2006. The show takes its name from the legal concept of diplomatic immunity. It was hosted by Richard Roth, CNN's UN correspondent. The program featured interviews with UN insiders such as Mark Malloch Brown, chief of staff to former Secretary-General Kofi Annan, as well as with Annan himself. Additionally, the program featured debates among a rotating panel of journalists covering the UN and international diplomacy, moderated by Roth. The program was filmed in New York City due to the location of United Nations headquarters.",
                "popularity": 0.6,
                "poster_path": null,
                "first_air_date": "",
                "name": "Diplomatic License",
                "vote_average": 0.0,
                "vote_count": 0
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [],
                "id": 38500,
                "origin_country": [
                    "HU"
                ],
                "original_language": "en",
                "original_name": "Diplomatavadász",
                "overview": "",
                "popularity": 0.6,
                "poster_path": null,
                "first_air_date": "",
                "name": "Diplomatavadász",
                "vote_average": 0.0,
                "vote_count": 0
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    18
                ],
                "id": 21170,
                "origin_country": [
                    "AU"
                ],
                "original_language": "en",
                "original_name": "False Witness",
                "overview": "A British diplomat is arrested on charges of working with Russian mafia. After death threats to his wife, they are taken into protective custody. Then the MI6 shows up with a new piece of the puzzle.",
                "popularity": 4.849,
                "poster_path": "/xaUgci5oAiwn81OnflaHfAY72lK.jpg",
                "first_air_date": "2009-01-11",
                "name": "False Witness",
                "vote_average": 2.0,
                "vote_count": 1
            }
        ],
        "total_pages": 1,
        "total_results": 14
    }
    """.data(using: .utf8)!
}

var watchProviderResultData: Data {
    return """
    {
        "id": 10195,
        "results": {
            "AD": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=AD",
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 7
                    }
                ]
            },
            "AE": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=AE",
                "buy": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 1
                    }
                ],
                "rent": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 1
                    }
                ]
            },
            "AL": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=AL",
                "buy": [
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 1000
                    }
                ],
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 7
                    }
                ],
                "rent": [
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 1000
                    }
                ]
            },
            "AR": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=AR",
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 1
                    }
                ],
                "buy": [
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 6
                    }
                ]
            },
            "AT": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=AT",
                "rent": [
                    {
                        "logo_path": "/5NyLm42TmCqCMOZFvH4fcoSNKEW.jpg",
                        "provider_id": 10,
                        "provider_name": "Amazon Video",
                        "display_priority": 3
                    },
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 4
                    },
                    {
                        "logo_path": "/3WN3S7D5f41d3RhI2jtVbTehlf2.jpg",
                        "provider_id": 1856,
                        "provider_name": "Magenta TV",
                        "display_priority": 6
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 8
                    },
                    {
                        "logo_path": "/cksgBjTHV3rzAVaO2zUyS1mH4Ke.jpg",
                        "provider_id": 40,
                        "provider_name": "Chili",
                        "display_priority": 10
                    },
                    {
                        "logo_path": "/5GEbAhFW2S5T8zVc1MNvz00pIzM.jpg",
                        "provider_id": 35,
                        "provider_name": "Rakuten TV",
                        "display_priority": 11
                    },
                    {
                        "logo_path": "/2PTFxgrswnEuK0szl87iSd8Yszz.jpg",
                        "provider_id": 20,
                        "provider_name": "maxdome Store",
                        "display_priority": 16
                    },
                    {
                        "logo_path": "/2pCbao1J9s0DMak2KKnEzmzHni8.jpg",
                        "provider_id": 130,
                        "provider_name": "Sky Store",
                        "display_priority": 24
                    },
                    {
                        "logo_path": "/2tAjxjo1n3H7fsXqMsxWFMeFUWp.jpg",
                        "provider_id": 177,
                        "provider_name": "Pantaflix",
                        "display_priority": 27
                    }
                ],
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 2
                    },
                    {
                        "logo_path": "/uULoezj2skPc6amfwru72UPjYXV.jpg",
                        "provider_id": 178,
                        "provider_name": "MagentaTV",
                        "display_priority": 7
                    }
                ],
                "buy": [
                    {
                        "logo_path": "/5NyLm42TmCqCMOZFvH4fcoSNKEW.jpg",
                        "provider_id": 10,
                        "provider_name": "Amazon Video",
                        "display_priority": 3
                    },
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 4
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 8
                    },
                    {
                        "logo_path": "/cksgBjTHV3rzAVaO2zUyS1mH4Ke.jpg",
                        "provider_id": 40,
                        "provider_name": "Chili",
                        "display_priority": 10
                    },
                    {
                        "logo_path": "/5GEbAhFW2S5T8zVc1MNvz00pIzM.jpg",
                        "provider_id": 35,
                        "provider_name": "Rakuten TV",
                        "display_priority": 11
                    },
                    {
                        "logo_path": "/2PTFxgrswnEuK0szl87iSd8Yszz.jpg",
                        "provider_id": 20,
                        "provider_name": "maxdome Store",
                        "display_priority": 16
                    },
                    {
                        "logo_path": "/2pCbao1J9s0DMak2KKnEzmzHni8.jpg",
                        "provider_id": 130,
                        "provider_name": "Sky Store",
                        "display_priority": 24
                    }
                ]
            },
            "AU": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=AU",
                "rent": [
                    {
                        "logo_path": "/6HtR4lwikdriuJi86cZa3nXjB3d.jpg",
                        "provider_id": 24,
                        "provider_name": "Quickflix Store",
                        "display_priority": 1000
                    }
                ],
                "buy": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 10
                    },
                    {
                        "logo_path": "/5NyLm42TmCqCMOZFvH4fcoSNKEW.jpg",
                        "provider_id": 10,
                        "provider_name": "Amazon Video",
                        "display_priority": 12
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 14
                    },
                    {
                        "logo_path": "/shq88b09gTBYC4hA7K7MUL8Q4zP.jpg",
                        "provider_id": 68,
                        "provider_name": "Microsoft Store",
                        "display_priority": 18
                    },
                    {
                        "logo_path": "/oIkQkEkwfmcG7IGpRR1NB8frZZM.jpg",
                        "provider_id": 192,
                        "provider_name": "YouTube",
                        "display_priority": 22
                    },
                    {
                        "logo_path": "/zXDDsD9M5vO7lqoqlBQCOcZtKBS.jpg",
                        "provider_id": 429,
                        "provider_name": "Telstra TV",
                        "display_priority": 32
                    },
                    {
                        "logo_path": "/bKy2YjC0QxViRnd8ayd2pv2ugJZ.jpg",
                        "provider_id": 436,
                        "provider_name": "Fetch TV",
                        "display_priority": 34
                    }
                ],
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 2
                    }
                ]
            },
            "BA": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=BA",
                "rent": [
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 1000
                    }
                ],
                "buy": [
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 1000
                    }
                ],
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 7
                    }
                ]
            },
            "BE": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=BE",
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 1
                    }
                ],
                "rent": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 6
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 7
                    },
                    {
                        "logo_path": "/5GEbAhFW2S5T8zVc1MNvz00pIzM.jpg",
                        "provider_id": 35,
                        "provider_name": "Rakuten TV",
                        "display_priority": 10
                    },
                    {
                        "logo_path": "/5NyLm42TmCqCMOZFvH4fcoSNKEW.jpg",
                        "provider_id": 10,
                        "provider_name": "Amazon Video",
                        "display_priority": 1000
                    },
                    {
                        "logo_path": "/jWKX6kO7JqQbqVnu9QtEO6FC85n.jpg",
                        "provider_id": 697,
                        "provider_name": "meJane",
                        "display_priority": 1000
                    }
                ],
                "buy": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 6
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 7
                    },
                    {
                        "logo_path": "/5GEbAhFW2S5T8zVc1MNvz00pIzM.jpg",
                        "provider_id": 35,
                        "provider_name": "Rakuten TV",
                        "display_priority": 10
                    },
                    {
                        "logo_path": "/5NyLm42TmCqCMOZFvH4fcoSNKEW.jpg",
                        "provider_id": 10,
                        "provider_name": "Amazon Video",
                        "display_priority": 1000
                    }
                ]
            },
            "BG": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=BG",
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 18
                    }
                ],
                "rent": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 2
                    }
                ],
                "buy": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 2
                    }
                ]
            },
            "BO": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=BO",
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 2
                    }
                ]
            },
            "BR": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=BR",
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 1
                    }
                ]
            },
            "CA": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=CA",
                "buy": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 6
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 8
                    },
                    {
                        "logo_path": "/yNr05VQlKK4dI0Ncwf9InIVGKs9.jpg",
                        "provider_id": 140,
                        "provider_name": "Cineplex",
                        "display_priority": 13
                    },
                    {
                        "logo_path": "/shq88b09gTBYC4hA7K7MUL8Q4zP.jpg",
                        "provider_id": 68,
                        "provider_name": "Microsoft Store",
                        "display_priority": 16
                    },
                    {
                        "logo_path": "/oIkQkEkwfmcG7IGpRR1NB8frZZM.jpg",
                        "provider_id": 192,
                        "provider_name": "YouTube",
                        "display_priority": 30
                    },
                    {
                        "logo_path": "/5NyLm42TmCqCMOZFvH4fcoSNKEW.jpg",
                        "provider_id": 10,
                        "provider_name": "Amazon Video",
                        "display_priority": 58
                    }
                ],
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 1
                    }
                ],
                "rent": [
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 8
                    },
                    {
                        "logo_path": "/yNr05VQlKK4dI0Ncwf9InIVGKs9.jpg",
                        "provider_id": 140,
                        "provider_name": "Cineplex",
                        "display_priority": 13
                    },
                    {
                        "logo_path": "/shq88b09gTBYC4hA7K7MUL8Q4zP.jpg",
                        "provider_id": 68,
                        "provider_name": "Microsoft Store",
                        "display_priority": 16
                    },
                    {
                        "logo_path": "/oIkQkEkwfmcG7IGpRR1NB8frZZM.jpg",
                        "provider_id": 192,
                        "provider_name": "YouTube",
                        "display_priority": 30
                    },
                    {
                        "logo_path": "/5NyLm42TmCqCMOZFvH4fcoSNKEW.jpg",
                        "provider_id": 10,
                        "provider_name": "Amazon Video",
                        "display_priority": 58
                    }
                ]
            },
            "CH": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=CH",
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 2
                    }
                ],
                "rent": [
                    {
                        "logo_path": "/rVOOhp6V8FheEAKtFAJMLMbnaMZ.jpg",
                        "provider_id": 150,
                        "provider_name": "blue TV",
                        "display_priority": 3
                    },
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 4
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 5
                    },
                    {
                        "logo_path": "/shq88b09gTBYC4hA7K7MUL8Q4zP.jpg",
                        "provider_id": 68,
                        "provider_name": "Microsoft Store",
                        "display_priority": 6
                    },
                    {
                        "logo_path": "/5GEbAhFW2S5T8zVc1MNvz00pIzM.jpg",
                        "provider_id": 35,
                        "provider_name": "Rakuten TV",
                        "display_priority": 10
                    }
                ],
                "buy": [
                    {
                        "logo_path": "/rVOOhp6V8FheEAKtFAJMLMbnaMZ.jpg",
                        "provider_id": 150,
                        "provider_name": "blue TV",
                        "display_priority": 3
                    },
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 4
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 5
                    },
                    {
                        "logo_path": "/shq88b09gTBYC4hA7K7MUL8Q4zP.jpg",
                        "provider_id": 68,
                        "provider_name": "Microsoft Store",
                        "display_priority": 6
                    },
                    {
                        "logo_path": "/5GEbAhFW2S5T8zVc1MNvz00pIzM.jpg",
                        "provider_id": 35,
                        "provider_name": "Rakuten TV",
                        "display_priority": 10
                    },
                    {
                        "logo_path": "/jmyYN1124dDIzqMysLekixy3AzF.jpg",
                        "provider_id": 164,
                        "provider_name": "Hollystar",
                        "display_priority": 1000
                    }
                ]
            },
            "CL": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=CL",
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 1
                    },
                    {
                        "logo_path": "/cDzkhgvozSr4GW2aRdV22uDuFpw.jpg",
                        "provider_id": 339,
                        "provider_name": "Movistar Play",
                        "display_priority": 9
                    }
                ],
                "buy": [
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 4
                    }
                ]
            },
            "CO": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=CO",
                "buy": [
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 3
                    }
                ],
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 1
                    },
                    {
                        "logo_path": "/cDzkhgvozSr4GW2aRdV22uDuFpw.jpg",
                        "provider_id": 339,
                        "provider_name": "Movistar Play",
                        "display_priority": 9
                    }
                ]
            },
            "CR": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=CR",
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 2
                    }
                ]
            },
            "CV": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=CV",
                "rent": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 13
                    }
                ],
                "buy": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 13
                    }
                ]
            },
            "CZ": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=CZ",
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 9
                    }
                ],
                "rent": [
                    {
                        "logo_path": "/wTF37o4jOkQfjnWe41gmeuASYZA.jpg",
                        "provider_id": 308,
                        "provider_name": "O2 TV",
                        "display_priority": 2
                    },
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 3
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 4
                    }
                ],
                "buy": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 3
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 4
                    }
                ]
            },
            "DE": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=DE",
                "rent": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 4
                    },
                    {
                        "logo_path": "/5NyLm42TmCqCMOZFvH4fcoSNKEW.jpg",
                        "provider_id": 10,
                        "provider_name": "Amazon Video",
                        "display_priority": 7
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 8
                    },
                    {
                        "logo_path": "/oIkQkEkwfmcG7IGpRR1NB8frZZM.jpg",
                        "provider_id": 192,
                        "provider_name": "YouTube",
                        "display_priority": 10
                    },
                    {
                        "logo_path": "/2pCbao1J9s0DMak2KKnEzmzHni8.jpg",
                        "provider_id": 130,
                        "provider_name": "Sky Store",
                        "display_priority": 11
                    },
                    {
                        "logo_path": "/5GEbAhFW2S5T8zVc1MNvz00pIzM.jpg",
                        "provider_id": 35,
                        "provider_name": "Rakuten TV",
                        "display_priority": 13
                    },
                    {
                        "logo_path": "/cksgBjTHV3rzAVaO2zUyS1mH4Ke.jpg",
                        "provider_id": 40,
                        "provider_name": "Chili",
                        "display_priority": 15
                    },
                    {
                        "logo_path": "/2PTFxgrswnEuK0szl87iSd8Yszz.jpg",
                        "provider_id": 20,
                        "provider_name": "maxdome Store",
                        "display_priority": 16
                    },
                    {
                        "logo_path": "/uULoezj2skPc6amfwru72UPjYXV.jpg",
                        "provider_id": 178,
                        "provider_name": "MagentaTV",
                        "display_priority": 24
                    },
                    {
                        "logo_path": "/shq88b09gTBYC4hA7K7MUL8Q4zP.jpg",
                        "provider_id": 68,
                        "provider_name": "Microsoft Store",
                        "display_priority": 34
                    },
                    {
                        "logo_path": "/2tAjxjo1n3H7fsXqMsxWFMeFUWp.jpg",
                        "provider_id": 177,
                        "provider_name": "Pantaflix",
                        "display_priority": 35
                    }
                ],
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 2
                    }
                ],
                "buy": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 4
                    },
                    {
                        "logo_path": "/5NyLm42TmCqCMOZFvH4fcoSNKEW.jpg",
                        "provider_id": 10,
                        "provider_name": "Amazon Video",
                        "display_priority": 7
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 8
                    },
                    {
                        "logo_path": "/oIkQkEkwfmcG7IGpRR1NB8frZZM.jpg",
                        "provider_id": 192,
                        "provider_name": "YouTube",
                        "display_priority": 10
                    },
                    {
                        "logo_path": "/2pCbao1J9s0DMak2KKnEzmzHni8.jpg",
                        "provider_id": 130,
                        "provider_name": "Sky Store",
                        "display_priority": 11
                    },
                    {
                        "logo_path": "/5GEbAhFW2S5T8zVc1MNvz00pIzM.jpg",
                        "provider_id": 35,
                        "provider_name": "Rakuten TV",
                        "display_priority": 13
                    },
                    {
                        "logo_path": "/cksgBjTHV3rzAVaO2zUyS1mH4Ke.jpg",
                        "provider_id": 40,
                        "provider_name": "Chili",
                        "display_priority": 15
                    },
                    {
                        "logo_path": "/2PTFxgrswnEuK0szl87iSd8Yszz.jpg",
                        "provider_id": 20,
                        "provider_name": "maxdome Store",
                        "display_priority": 16
                    },
                    {
                        "logo_path": "/uULoezj2skPc6amfwru72UPjYXV.jpg",
                        "provider_id": 178,
                        "provider_name": "MagentaTV",
                        "display_priority": 24
                    },
                    {
                        "logo_path": "/shq88b09gTBYC4hA7K7MUL8Q4zP.jpg",
                        "provider_id": 68,
                        "provider_name": "Microsoft Store",
                        "display_priority": 34
                    }
                ]
            },
            "DK": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=DK",
                "buy": [
                    {
                        "logo_path": "/cvl65OJnz14LUlC3yGK1KHj8UYs.jpg",
                        "provider_id": 76,
                        "provider_name": "Viaplay",
                        "display_priority": 6
                    },
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 7
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 8
                    },
                    {
                        "logo_path": "/shq88b09gTBYC4hA7K7MUL8Q4zP.jpg",
                        "provider_id": 68,
                        "provider_name": "Microsoft Store",
                        "display_priority": 10
                    },
                    {
                        "logo_path": "/5GEbAhFW2S5T8zVc1MNvz00pIzM.jpg",
                        "provider_id": 35,
                        "provider_name": "Rakuten TV",
                        "display_priority": 18
                    },
                    {
                        "logo_path": "/3QsJbibv5dFW2IYuXbTjxDmGGRZ.jpg",
                        "provider_id": 423,
                        "provider_name": "Blockbuster",
                        "display_priority": 20
                    },
                    {
                        "logo_path": "/dNcz2AZHPEgt4BIKJe56r4visuK.jpg",
                        "provider_id": 426,
                        "provider_name": "SF Anytime",
                        "display_priority": 21
                    }
                ],
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 1
                    }
                ],
                "rent": [
                    {
                        "logo_path": "/cvl65OJnz14LUlC3yGK1KHj8UYs.jpg",
                        "provider_id": 76,
                        "provider_name": "Viaplay",
                        "display_priority": 6
                    },
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 7
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 8
                    },
                    {
                        "logo_path": "/shq88b09gTBYC4hA7K7MUL8Q4zP.jpg",
                        "provider_id": 68,
                        "provider_name": "Microsoft Store",
                        "display_priority": 10
                    },
                    {
                        "logo_path": "/5GEbAhFW2S5T8zVc1MNvz00pIzM.jpg",
                        "provider_id": 35,
                        "provider_name": "Rakuten TV",
                        "display_priority": 18
                    },
                    {
                        "logo_path": "/3QsJbibv5dFW2IYuXbTjxDmGGRZ.jpg",
                        "provider_id": 423,
                        "provider_name": "Blockbuster",
                        "display_priority": 20
                    },
                    {
                        "logo_path": "/dNcz2AZHPEgt4BIKJe56r4visuK.jpg",
                        "provider_id": 426,
                        "provider_name": "SF Anytime",
                        "display_priority": 21
                    }
                ]
            },
            "DO": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=DO",
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 30
                    }
                ]
            },
            "EC": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=EC",
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 1
                    }
                ],
                "buy": [
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 11
                    }
                ]
            },
            "EE": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=EE",
                "rent": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 3
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 4
                    }
                ],
                "buy": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 3
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 4
                    }
                ],
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 24
                    }
                ]
            },
            "EG": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=EG",
                "rent": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 2
                    }
                ],
                "buy": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 2
                    }
                ]
            },
            "ES": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=ES",
                "buy": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 4
                    },
                    {
                        "logo_path": "/5GEbAhFW2S5T8zVc1MNvz00pIzM.jpg",
                        "provider_id": 35,
                        "provider_name": "Rakuten TV",
                        "display_priority": 11
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 13
                    },
                    {
                        "logo_path": "/shq88b09gTBYC4hA7K7MUL8Q4zP.jpg",
                        "provider_id": 68,
                        "provider_name": "Microsoft Store",
                        "display_priority": 14
                    },
                    {
                        "logo_path": "/5NyLm42TmCqCMOZFvH4fcoSNKEW.jpg",
                        "provider_id": 10,
                        "provider_name": "Amazon Video",
                        "display_priority": 36
                    }
                ],
                "rent": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 4
                    },
                    {
                        "logo_path": "/5GEbAhFW2S5T8zVc1MNvz00pIzM.jpg",
                        "provider_id": 35,
                        "provider_name": "Rakuten TV",
                        "display_priority": 11
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 13
                    },
                    {
                        "logo_path": "/shq88b09gTBYC4hA7K7MUL8Q4zP.jpg",
                        "provider_id": 68,
                        "provider_name": "Microsoft Store",
                        "display_priority": 14
                    },
                    {
                        "logo_path": "/5NyLm42TmCqCMOZFvH4fcoSNKEW.jpg",
                        "provider_id": 10,
                        "provider_name": "Amazon Video",
                        "display_priority": 36
                    }
                ],
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 2
                    },
                    {
                        "logo_path": "/4ywRQTLYJk8CjroNX4FbCBDQZTr.jpg",
                        "provider_id": 149,
                        "provider_name": "Movistar Plus",
                        "display_priority": 10
                    }
                ]
            },
            "FI": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=FI",
                "rent": [
                    {
                        "logo_path": "/cvl65OJnz14LUlC3yGK1KHj8UYs.jpg",
                        "provider_id": 76,
                        "provider_name": "Viaplay",
                        "display_priority": 5
                    },
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 10
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 11
                    },
                    {
                        "logo_path": "/shq88b09gTBYC4hA7K7MUL8Q4zP.jpg",
                        "provider_id": 68,
                        "provider_name": "Microsoft Store",
                        "display_priority": 12
                    },
                    {
                        "logo_path": "/5GEbAhFW2S5T8zVc1MNvz00pIzM.jpg",
                        "provider_id": 35,
                        "provider_name": "Rakuten TV",
                        "display_priority": 17
                    },
                    {
                        "logo_path": "/3QsJbibv5dFW2IYuXbTjxDmGGRZ.jpg",
                        "provider_id": 423,
                        "provider_name": "Blockbuster",
                        "display_priority": 18
                    },
                    {
                        "logo_path": "/dNcz2AZHPEgt4BIKJe56r4visuK.jpg",
                        "provider_id": 426,
                        "provider_name": "SF Anytime",
                        "display_priority": 19
                    },
                    {
                        "logo_path": "/ihE8Z4jZcGsmQsGRj6q06oxD2Wd.jpg",
                        "provider_id": 540,
                        "provider_name": "Elisa Viihde",
                        "display_priority": 25
                    },
                    {
                        "logo_path": "/xTVM8uXT9QocigQ07LE7Irc65W2.jpg",
                        "provider_id": 553,
                        "provider_name": "Telia Play",
                        "display_priority": 34
                    }
                ],
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 1
                    }
                ],
                "buy": [
                    {
                        "logo_path": "/cvl65OJnz14LUlC3yGK1KHj8UYs.jpg",
                        "provider_id": 76,
                        "provider_name": "Viaplay",
                        "display_priority": 5
                    },
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 10
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 11
                    },
                    {
                        "logo_path": "/shq88b09gTBYC4hA7K7MUL8Q4zP.jpg",
                        "provider_id": 68,
                        "provider_name": "Microsoft Store",
                        "display_priority": 12
                    },
                    {
                        "logo_path": "/5GEbAhFW2S5T8zVc1MNvz00pIzM.jpg",
                        "provider_id": 35,
                        "provider_name": "Rakuten TV",
                        "display_priority": 17
                    },
                    {
                        "logo_path": "/3QsJbibv5dFW2IYuXbTjxDmGGRZ.jpg",
                        "provider_id": 423,
                        "provider_name": "Blockbuster",
                        "display_priority": 18
                    },
                    {
                        "logo_path": "/dNcz2AZHPEgt4BIKJe56r4visuK.jpg",
                        "provider_id": 426,
                        "provider_name": "SF Anytime",
                        "display_priority": 19
                    },
                    {
                        "logo_path": "/ihE8Z4jZcGsmQsGRj6q06oxD2Wd.jpg",
                        "provider_id": 540,
                        "provider_name": "Elisa Viihde",
                        "display_priority": 25
                    }
                ]
            },
            "FR": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=FR",
                "rent": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 5
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 7
                    },
                    {
                        "logo_path": "/ddWcbe8fYAfcQMjighzWGLjjyip.jpg",
                        "provider_id": 61,
                        "provider_name": "Orange VOD",
                        "display_priority": 10
                    },
                    {
                        "logo_path": "/oIkQkEkwfmcG7IGpRR1NB8frZZM.jpg",
                        "provider_id": 192,
                        "provider_name": "YouTube",
                        "display_priority": 15
                    },
                    {
                        "logo_path": "/knpqBvBQjyHnFrYPJ9bbtUCv6uo.jpg",
                        "provider_id": 58,
                        "provider_name": "Canal VOD",
                        "display_priority": 18
                    },
                    {
                        "logo_path": "/5GEbAhFW2S5T8zVc1MNvz00pIzM.jpg",
                        "provider_id": 35,
                        "provider_name": "Rakuten TV",
                        "display_priority": 22
                    },
                    {
                        "logo_path": "/5NyLm42TmCqCMOZFvH4fcoSNKEW.jpg",
                        "provider_id": 10,
                        "provider_name": "Amazon Video",
                        "display_priority": 46
                    }
                ],
                "buy": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 5
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 7
                    },
                    {
                        "logo_path": "/ddWcbe8fYAfcQMjighzWGLjjyip.jpg",
                        "provider_id": 61,
                        "provider_name": "Orange VOD",
                        "display_priority": 10
                    },
                    {
                        "logo_path": "/shq88b09gTBYC4hA7K7MUL8Q4zP.jpg",
                        "provider_id": 68,
                        "provider_name": "Microsoft Store",
                        "display_priority": 14
                    },
                    {
                        "logo_path": "/oIkQkEkwfmcG7IGpRR1NB8frZZM.jpg",
                        "provider_id": 192,
                        "provider_name": "YouTube",
                        "display_priority": 15
                    },
                    {
                        "logo_path": "/knpqBvBQjyHnFrYPJ9bbtUCv6uo.jpg",
                        "provider_id": 58,
                        "provider_name": "Canal VOD",
                        "display_priority": 18
                    },
                    {
                        "logo_path": "/5GEbAhFW2S5T8zVc1MNvz00pIzM.jpg",
                        "provider_id": 35,
                        "provider_name": "Rakuten TV",
                        "display_priority": 22
                    },
                    {
                        "logo_path": "/5NyLm42TmCqCMOZFvH4fcoSNKEW.jpg",
                        "provider_id": 10,
                        "provider_name": "Amazon Video",
                        "display_priority": 46
                    }
                ],
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 2
                    }
                ]
            },
            "GB": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=GB",
                "buy": [
                    {
                        "logo_path": "/5NyLm42TmCqCMOZFvH4fcoSNKEW.jpg",
                        "provider_id": 10,
                        "provider_name": "Amazon Video",
                        "display_priority": 4
                    },
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 5
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 12
                    },
                    {
                        "logo_path": "/2pCbao1J9s0DMak2KKnEzmzHni8.jpg",
                        "provider_id": 130,
                        "provider_name": "Sky Store",
                        "display_priority": 14
                    },
                    {
                        "logo_path": "/cksgBjTHV3rzAVaO2zUyS1mH4Ke.jpg",
                        "provider_id": 40,
                        "provider_name": "Chili",
                        "display_priority": 15
                    },
                    {
                        "logo_path": "/shq88b09gTBYC4hA7K7MUL8Q4zP.jpg",
                        "provider_id": 68,
                        "provider_name": "Microsoft Store",
                        "display_priority": 16
                    },
                    {
                        "logo_path": "/oIkQkEkwfmcG7IGpRR1NB8frZZM.jpg",
                        "provider_id": 192,
                        "provider_name": "YouTube",
                        "display_priority": 22
                    },
                    {
                        "logo_path": "/5GEbAhFW2S5T8zVc1MNvz00pIzM.jpg",
                        "provider_id": 35,
                        "provider_name": "Rakuten TV",
                        "display_priority": 29
                    }
                ],
                "rent": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 5
                    },
                    {
                        "logo_path": "/2pCbao1J9s0DMak2KKnEzmzHni8.jpg",
                        "provider_id": 130,
                        "provider_name": "Sky Store",
                        "display_priority": 14
                    },
                    {
                        "logo_path": "/5GEbAhFW2S5T8zVc1MNvz00pIzM.jpg",
                        "provider_id": 35,
                        "provider_name": "Rakuten TV",
                        "display_priority": 29
                    }
                ],
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 1
                    }
                ]
            },
            "GH": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=GH",
                "rent": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 17
                    }
                ],
                "buy": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 17
                    }
                ]
            },
            "GR": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=GR",
                "rent": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 2
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 3
                    }
                ],
                "buy": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 2
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 3
                    }
                ],
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 20
                    }
                ]
            },
            "GT": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=GT",
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 2
                    }
                ]
            },
            "HK": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=HK",
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 37
                    }
                ]
            },
            "HN": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=HN",
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 2
                    }
                ]
            },
            "HR": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=HR",
                "rent": [
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 3
                    }
                ],
                "buy": [
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 3
                    }
                ],
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 38
                    }
                ]
            },
            "HU": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=HU",
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 11
                    }
                ],
                "rent": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 3
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 4
                    },
                    {
                        "logo_path": "/oIkQkEkwfmcG7IGpRR1NB8frZZM.jpg",
                        "provider_id": 192,
                        "provider_name": "YouTube",
                        "display_priority": 1000
                    }
                ],
                "buy": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 3
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 4
                    },
                    {
                        "logo_path": "/oIkQkEkwfmcG7IGpRR1NB8frZZM.jpg",
                        "provider_id": 192,
                        "provider_name": "YouTube",
                        "display_priority": 1000
                    }
                ]
            },
            "ID": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=ID",
                "flatrate": [
                    {
                        "logo_path": "/7Fl8ylPDclt3ZYgNbW2t7rbZE9I.jpg",
                        "provider_id": 122,
                        "provider_name": "Hotstar",
                        "display_priority": 3
                    }
                ]
            },
            "IE": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=IE",
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 2
                    }
                ],
                "buy": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 4
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 7
                    },
                    {
                        "logo_path": "/2pCbao1J9s0DMak2KKnEzmzHni8.jpg",
                        "provider_id": 130,
                        "provider_name": "Sky Store",
                        "display_priority": 9
                    },
                    {
                        "logo_path": "/5GEbAhFW2S5T8zVc1MNvz00pIzM.jpg",
                        "provider_id": 35,
                        "provider_name": "Rakuten TV",
                        "display_priority": 12
                    },
                    {
                        "logo_path": "/shq88b09gTBYC4hA7K7MUL8Q4zP.jpg",
                        "provider_id": 68,
                        "provider_name": "Microsoft Store",
                        "display_priority": 14
                    }
                ],
                "rent": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 4
                    },
                    {
                        "logo_path": "/2pCbao1J9s0DMak2KKnEzmzHni8.jpg",
                        "provider_id": 130,
                        "provider_name": "Sky Store",
                        "display_priority": 9
                    },
                    {
                        "logo_path": "/5GEbAhFW2S5T8zVc1MNvz00pIzM.jpg",
                        "provider_id": 35,
                        "provider_name": "Rakuten TV",
                        "display_priority": 12
                    }
                ]
            },
            "IL": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=IL",
                "buy": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 28
                    }
                ],
                "rent": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 28
                    }
                ]
            },
            "IN": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=IN",
                "buy": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 8
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 10
                    },
                    {
                        "logo_path": "/oIkQkEkwfmcG7IGpRR1NB8frZZM.jpg",
                        "provider_id": 192,
                        "provider_name": "YouTube",
                        "display_priority": 13
                    }
                ],
                "rent": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 8
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 10
                    },
                    {
                        "logo_path": "/oIkQkEkwfmcG7IGpRR1NB8frZZM.jpg",
                        "provider_id": 192,
                        "provider_name": "YouTube",
                        "display_priority": 13
                    },
                    {
                        "logo_path": "/qLR6qzB1IcANZUqMEkLf6Sh8Y8s.jpg",
                        "provider_id": 502,
                        "provider_name": "Tata Play",
                        "display_priority": 27
                    }
                ],
                "flatrate": [
                    {
                        "logo_path": "/7Fl8ylPDclt3ZYgNbW2t7rbZE9I.jpg",
                        "provider_id": 122,
                        "provider_name": "Hotstar",
                        "display_priority": 2
                    }
                ]
            },
            "IS": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=IS",
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 1
                    }
                ],
                "rent": [
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 4
                    },
                    {
                        "logo_path": "/cvl65OJnz14LUlC3yGK1KHj8UYs.jpg",
                        "provider_id": 76,
                        "provider_name": "Viaplay",
                        "display_priority": 29
                    }
                ],
                "buy": [
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 4
                    },
                    {
                        "logo_path": "/cvl65OJnz14LUlC3yGK1KHj8UYs.jpg",
                        "provider_id": 76,
                        "provider_name": "Viaplay",
                        "display_priority": 29
                    }
                ]
            },
            "IT": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=IT",
                "buy": [
                    {
                        "logo_path": "/5GEbAhFW2S5T8zVc1MNvz00pIzM.jpg",
                        "provider_id": 35,
                        "provider_name": "Rakuten TV",
                        "display_priority": 3
                    },
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 4
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 7
                    },
                    {
                        "logo_path": "/cksgBjTHV3rzAVaO2zUyS1mH4Ke.jpg",
                        "provider_id": 40,
                        "provider_name": "Chili",
                        "display_priority": 11
                    },
                    {
                        "logo_path": "/shq88b09gTBYC4hA7K7MUL8Q4zP.jpg",
                        "provider_id": 68,
                        "provider_name": "Microsoft Store",
                        "display_priority": 22
                    },
                    {
                        "logo_path": "/5NyLm42TmCqCMOZFvH4fcoSNKEW.jpg",
                        "provider_id": 10,
                        "provider_name": "Amazon Video",
                        "display_priority": 40
                    }
                ],
                "rent": [
                    {
                        "logo_path": "/5GEbAhFW2S5T8zVc1MNvz00pIzM.jpg",
                        "provider_id": 35,
                        "provider_name": "Rakuten TV",
                        "display_priority": 3
                    },
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 4
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 7
                    },
                    {
                        "logo_path": "/cksgBjTHV3rzAVaO2zUyS1mH4Ke.jpg",
                        "provider_id": 40,
                        "provider_name": "Chili",
                        "display_priority": 11
                    },
                    {
                        "logo_path": "/shq88b09gTBYC4hA7K7MUL8Q4zP.jpg",
                        "provider_id": 68,
                        "provider_name": "Microsoft Store",
                        "display_priority": 22
                    },
                    {
                        "logo_path": "/5NyLm42TmCqCMOZFvH4fcoSNKEW.jpg",
                        "provider_id": 10,
                        "provider_name": "Amazon Video",
                        "display_priority": 40
                    }
                ],
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 2
                    }
                ]
            },
            "JP": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=JP",
                "buy": [
                    {
                        "logo_path": "/5NyLm42TmCqCMOZFvH4fcoSNKEW.jpg",
                        "provider_id": 10,
                        "provider_name": "Amazon Video",
                        "display_priority": 6
                    },
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 7
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 9
                    }
                ],
                "rent": [
                    {
                        "logo_path": "/g8jqHtXJsMlc8B1Gb0Rt8AvUJMn.jpg",
                        "provider_id": 85,
                        "provider_name": "dTV",
                        "display_priority": 2
                    },
                    {
                        "logo_path": "/5NyLm42TmCqCMOZFvH4fcoSNKEW.jpg",
                        "provider_id": 10,
                        "provider_name": "Amazon Video",
                        "display_priority": 6
                    },
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 7
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 9
                    }
                ],
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 3
                    },
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 390,
                        "provider_name": "Disney Plus",
                        "display_priority": 1000
                    }
                ]
            },
            "KR": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=KR",
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 2
                    }
                ],
                "buy": [
                    {
                        "logo_path": "/2ioan5BX5L9tz4fIGU93blTeFhv.jpg",
                        "provider_id": 356,
                        "provider_name": "wavve",
                        "display_priority": 3
                    },
                    {
                        "logo_path": "/a4ciTQc27FsgdUp7PCrToHPygcw.jpg",
                        "provider_id": 96,
                        "provider_name": "Naver Store",
                        "display_priority": 6
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 7
                    }
                ]
            },
            "LI": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=LI",
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 30
                    }
                ]
            },
            "LT": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=LT",
                "rent": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 3
                    },
                    {
                        "logo_path": "/xTVM8uXT9QocigQ07LE7Irc65W2.jpg",
                        "provider_id": 553,
                        "provider_name": "Telia Play",
                        "display_priority": 15
                    }
                ],
                "buy": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 3
                    }
                ],
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 25
                    }
                ]
            },
            "LV": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=LV",
                "rent": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 3
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 4
                    }
                ],
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 24
                    }
                ],
                "buy": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 3
                    }
                ]
            },
            "MD": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=MD",
                "rent": [
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 1000
                    }
                ],
                "buy": [
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 1000
                    }
                ]
            },
            "MK": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=MK",
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 7
                    }
                ],
                "rent": [
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 1000
                    }
                ],
                "buy": [
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 1000
                    }
                ]
            },
            "MT": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=MT",
                "rent": [
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 1000
                    }
                ],
                "buy": [
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 1000
                    }
                ],
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 7
                    }
                ]
            },
            "MU": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=MU",
                "buy": [
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 1000
                    }
                ],
                "rent": [
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 1000
                    }
                ]
            },
            "MX": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=MX",
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 2
                    }
                ]
            },
            "MY": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=MY",
                "flatrate": [
                    {
                        "logo_path": "/7Fl8ylPDclt3ZYgNbW2t7rbZE9I.jpg",
                        "provider_id": 122,
                        "provider_name": "Hotstar",
                        "display_priority": 0
                    }
                ]
            },
            "MZ": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=MZ",
                "rent": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 16
                    }
                ],
                "buy": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 16
                    }
                ]
            },
            "NE": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=NE",
                "rent": [
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 1000
                    }
                ],
                "buy": [
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 1000
                    }
                ]
            },
            "NL": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=NL",
                "buy": [
                    {
                        "logo_path": "/llmnYOyknekZsXtkCaazKjhTLvG.jpg",
                        "provider_id": 71,
                        "provider_name": "Pathé Thuis",
                        "display_priority": 7
                    },
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 8
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 11
                    },
                    {
                        "logo_path": "/shq88b09gTBYC4hA7K7MUL8Q4zP.jpg",
                        "provider_id": 68,
                        "provider_name": "Microsoft Store",
                        "display_priority": 12
                    },
                    {
                        "logo_path": "/5GEbAhFW2S5T8zVc1MNvz00pIzM.jpg",
                        "provider_id": 35,
                        "provider_name": "Rakuten TV",
                        "display_priority": 13
                    },
                    {
                        "logo_path": "/5NyLm42TmCqCMOZFvH4fcoSNKEW.jpg",
                        "provider_id": 10,
                        "provider_name": "Amazon Video",
                        "display_priority": 40
                    }
                ],
                "rent": [
                    {
                        "logo_path": "/llmnYOyknekZsXtkCaazKjhTLvG.jpg",
                        "provider_id": 71,
                        "provider_name": "Pathé Thuis",
                        "display_priority": 7
                    },
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 8
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 11
                    },
                    {
                        "logo_path": "/shq88b09gTBYC4hA7K7MUL8Q4zP.jpg",
                        "provider_id": 68,
                        "provider_name": "Microsoft Store",
                        "display_priority": 12
                    },
                    {
                        "logo_path": "/5GEbAhFW2S5T8zVc1MNvz00pIzM.jpg",
                        "provider_id": 35,
                        "provider_name": "Rakuten TV",
                        "display_priority": 13
                    },
                    {
                        "logo_path": "/5NyLm42TmCqCMOZFvH4fcoSNKEW.jpg",
                        "provider_id": 10,
                        "provider_name": "Amazon Video",
                        "display_priority": 40
                    },
                    {
                        "logo_path": "/jWKX6kO7JqQbqVnu9QtEO6FC85n.jpg",
                        "provider_id": 697,
                        "provider_name": "meJane",
                        "display_priority": 48
                    }
                ],
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 1
                    }
                ]
            },
            "NO": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=NO",
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 1
                    }
                ],
                "buy": [
                    {
                        "logo_path": "/cvl65OJnz14LUlC3yGK1KHj8UYs.jpg",
                        "provider_id": 76,
                        "provider_name": "Viaplay",
                        "display_priority": 4
                    },
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 6
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 8
                    },
                    {
                        "logo_path": "/shq88b09gTBYC4hA7K7MUL8Q4zP.jpg",
                        "provider_id": 68,
                        "provider_name": "Microsoft Store",
                        "display_priority": 9
                    },
                    {
                        "logo_path": "/5GEbAhFW2S5T8zVc1MNvz00pIzM.jpg",
                        "provider_id": 35,
                        "provider_name": "Rakuten TV",
                        "display_priority": 16
                    },
                    {
                        "logo_path": "/3QsJbibv5dFW2IYuXbTjxDmGGRZ.jpg",
                        "provider_id": 423,
                        "provider_name": "Blockbuster",
                        "display_priority": 18
                    },
                    {
                        "logo_path": "/dNcz2AZHPEgt4BIKJe56r4visuK.jpg",
                        "provider_id": 426,
                        "provider_name": "SF Anytime",
                        "display_priority": 19
                    },
                    {
                        "logo_path": "/5nECaP8nhtrzZfx7oG0yoFMfqiA.jpg",
                        "provider_id": 431,
                        "provider_name": "TV 2 Play",
                        "display_priority": 20
                    }
                ],
                "rent": [
                    {
                        "logo_path": "/cvl65OJnz14LUlC3yGK1KHj8UYs.jpg",
                        "provider_id": 76,
                        "provider_name": "Viaplay",
                        "display_priority": 4
                    },
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 6
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 8
                    },
                    {
                        "logo_path": "/shq88b09gTBYC4hA7K7MUL8Q4zP.jpg",
                        "provider_id": 68,
                        "provider_name": "Microsoft Store",
                        "display_priority": 9
                    },
                    {
                        "logo_path": "/5GEbAhFW2S5T8zVc1MNvz00pIzM.jpg",
                        "provider_id": 35,
                        "provider_name": "Rakuten TV",
                        "display_priority": 16
                    },
                    {
                        "logo_path": "/3QsJbibv5dFW2IYuXbTjxDmGGRZ.jpg",
                        "provider_id": 423,
                        "provider_name": "Blockbuster",
                        "display_priority": 18
                    },
                    {
                        "logo_path": "/dNcz2AZHPEgt4BIKJe56r4visuK.jpg",
                        "provider_id": 426,
                        "provider_name": "SF Anytime",
                        "display_priority": 19
                    },
                    {
                        "logo_path": "/5nECaP8nhtrzZfx7oG0yoFMfqiA.jpg",
                        "provider_id": 431,
                        "provider_name": "TV 2 Play",
                        "display_priority": 20
                    }
                ]
            },
            "NZ": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=NZ",
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 3
                    }
                ],
                "rent": [
                    {
                        "logo_path": "/6HtR4lwikdriuJi86cZa3nXjB3d.jpg",
                        "provider_id": 24,
                        "provider_name": "Quickflix Store",
                        "display_priority": 1000
                    }
                ],
                "buy": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 4
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 7
                    },
                    {
                        "logo_path": "/shq88b09gTBYC4hA7K7MUL8Q4zP.jpg",
                        "provider_id": 68,
                        "provider_name": "Microsoft Store",
                        "display_priority": 10
                    }
                ]
            },
            "PA": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=PA",
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 33
                    }
                ]
            },
            "PE": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=PE",
                "buy": [
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 5
                    }
                ],
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 1
                    }
                ]
            },
            "PH": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=PH",
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 31
                    }
                ]
            },
            "PL": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=PL",
                "buy": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 1
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 3
                    },
                    {
                        "logo_path": "/oIkQkEkwfmcG7IGpRR1NB8frZZM.jpg",
                        "provider_id": 192,
                        "provider_name": "YouTube",
                        "display_priority": 8
                    },
                    {
                        "logo_path": "/cksgBjTHV3rzAVaO2zUyS1mH4Ke.jpg",
                        "provider_id": 40,
                        "provider_name": "Chili",
                        "display_priority": 11
                    }
                ],
                "rent": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 1
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 3
                    },
                    {
                        "logo_path": "/oIkQkEkwfmcG7IGpRR1NB8frZZM.jpg",
                        "provider_id": 192,
                        "provider_name": "YouTube",
                        "display_priority": 8
                    },
                    {
                        "logo_path": "/cksgBjTHV3rzAVaO2zUyS1mH4Ke.jpg",
                        "provider_id": 40,
                        "provider_name": "Chili",
                        "display_priority": 11
                    }
                ],
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 10
                    },
                    {
                        "logo_path": "/uXc2fJqhtXfuNq6ha8tTLL9VnXj.jpg",
                        "provider_id": 505,
                        "provider_name": "Player",
                        "display_priority": 13
                    }
                ]
            },
            "PT": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=PT",
                "buy": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 4
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 5
                    },
                    {
                        "logo_path": "/oIkQkEkwfmcG7IGpRR1NB8frZZM.jpg",
                        "provider_id": 192,
                        "provider_name": "YouTube",
                        "display_priority": 7
                    },
                    {
                        "logo_path": "/5GEbAhFW2S5T8zVc1MNvz00pIzM.jpg",
                        "provider_id": 35,
                        "provider_name": "Rakuten TV",
                        "display_priority": 8
                    }
                ],
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 1
                    }
                ],
                "rent": [
                    {
                        "logo_path": "/dUeHhim2WUZz8S7EWjv0Ws6anRP.jpg",
                        "provider_id": 242,
                        "provider_name": "Meo",
                        "display_priority": 3
                    },
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 4
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 5
                    },
                    {
                        "logo_path": "/oIkQkEkwfmcG7IGpRR1NB8frZZM.jpg",
                        "provider_id": 192,
                        "provider_name": "YouTube",
                        "display_priority": 7
                    },
                    {
                        "logo_path": "/5GEbAhFW2S5T8zVc1MNvz00pIzM.jpg",
                        "provider_id": 35,
                        "provider_name": "Rakuten TV",
                        "display_priority": 8
                    }
                ]
            },
            "PY": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=PY",
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 2
                    }
                ]
            },
            "RO": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=RO",
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 10
                    },
                    {
                        "logo_path": "/l5Wxbsgral716BOtZsGyPVNn8GC.jpg",
                        "provider_id": 250,
                        "provider_name": "Horizon",
                        "display_priority": 1000
                    }
                ]
            },
            "RS": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=RS",
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 7
                    }
                ]
            },
            "RU": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=RU",
                "buy": [
                    {
                        "logo_path": "/1KAux0lBEHpLnQcvaf1Qf1uKcIP.jpg",
                        "provider_id": 117,
                        "provider_name": "Kinopoisk",
                        "display_priority": 24
                    }
                ],
                "flatrate": [
                    {
                        "logo_path": "/1KAux0lBEHpLnQcvaf1Qf1uKcIP.jpg",
                        "provider_id": 117,
                        "provider_name": "Kinopoisk",
                        "display_priority": 24
                    },
                    {
                        "logo_path": "/o9ExgOSLF3OTwR6T3DJOuwOKJgq.jpg",
                        "provider_id": 113,
                        "provider_name": "Ivi",
                        "display_priority": 1000
                    }
                ],
                "rent": [
                    {
                        "logo_path": "/o9ExgOSLF3OTwR6T3DJOuwOKJgq.jpg",
                        "provider_id": 113,
                        "provider_name": "Ivi",
                        "display_priority": 1000
                    }
                ]
            },
            "SA": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=SA",
                "buy": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 1
                    }
                ],
                "rent": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 1
                    }
                ]
            },
            "SE": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=SE",
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 1
                    }
                ],
                "rent": [
                    {
                        "logo_path": "/cvl65OJnz14LUlC3yGK1KHj8UYs.jpg",
                        "provider_id": 76,
                        "provider_name": "Viaplay",
                        "display_priority": 6
                    },
                    {
                        "logo_path": "/shq88b09gTBYC4hA7K7MUL8Q4zP.jpg",
                        "provider_id": 68,
                        "provider_name": "Microsoft Store",
                        "display_priority": 7
                    },
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 8
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 9
                    },
                    {
                        "logo_path": "/5GEbAhFW2S5T8zVc1MNvz00pIzM.jpg",
                        "provider_id": 35,
                        "provider_name": "Rakuten TV",
                        "display_priority": 17
                    },
                    {
                        "logo_path": "/3QsJbibv5dFW2IYuXbTjxDmGGRZ.jpg",
                        "provider_id": 423,
                        "provider_name": "Blockbuster",
                        "display_priority": 18
                    },
                    {
                        "logo_path": "/dNcz2AZHPEgt4BIKJe56r4visuK.jpg",
                        "provider_id": 426,
                        "provider_name": "SF Anytime",
                        "display_priority": 19
                    }
                ],
                "buy": [
                    {
                        "logo_path": "/cvl65OJnz14LUlC3yGK1KHj8UYs.jpg",
                        "provider_id": 76,
                        "provider_name": "Viaplay",
                        "display_priority": 6
                    },
                    {
                        "logo_path": "/shq88b09gTBYC4hA7K7MUL8Q4zP.jpg",
                        "provider_id": 68,
                        "provider_name": "Microsoft Store",
                        "display_priority": 7
                    },
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 8
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 9
                    },
                    {
                        "logo_path": "/5GEbAhFW2S5T8zVc1MNvz00pIzM.jpg",
                        "provider_id": 35,
                        "provider_name": "Rakuten TV",
                        "display_priority": 17
                    },
                    {
                        "logo_path": "/3QsJbibv5dFW2IYuXbTjxDmGGRZ.jpg",
                        "provider_id": 423,
                        "provider_name": "Blockbuster",
                        "display_priority": 18
                    },
                    {
                        "logo_path": "/dNcz2AZHPEgt4BIKJe56r4visuK.jpg",
                        "provider_id": 426,
                        "provider_name": "SF Anytime",
                        "display_priority": 19
                    }
                ]
            },
            "SG": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=SG",
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 2
                    }
                ]
            },
            "SI": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=SI",
                "buy": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 31
                    }
                ],
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 7
                    }
                ],
                "rent": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 31
                    }
                ]
            },
            "SK": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=SK",
                "rent": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 3
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 5
                    }
                ],
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 10
                    }
                ],
                "buy": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 3
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 5
                    }
                ]
            },
            "SM": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=SM",
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 30
                    }
                ]
            },
            "SN": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=SN",
                "rent": [
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 1000
                    }
                ],
                "buy": [
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 1000
                    }
                ]
            },
            "SV": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=SV",
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 33
                    }
                ]
            },
            "TH": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=TH",
                "flatrate": [
                    {
                        "logo_path": "/7Fl8ylPDclt3ZYgNbW2t7rbZE9I.jpg",
                        "provider_id": 122,
                        "provider_name": "Hotstar",
                        "display_priority": 0
                    }
                ]
            },
            "TR": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=TR",
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 9
                    }
                ],
                "buy": [
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 5
                    },
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 6
                    }
                ],
                "rent": [
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 5
                    },
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 6
                    }
                ]
            },
            "TW": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=TW",
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 2
                    }
                ]
            },
            "TZ": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=TZ",
                "buy": [
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 20
                    }
                ],
                "rent": [
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 20
                    }
                ]
            },
            "UG": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=UG",
                "rent": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 16
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 1000
                    }
                ],
                "buy": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 16
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 1000
                    }
                ]
            },
            "US": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=US",
                "buy": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 4
                    },
                    {
                        "logo_path": "/5NyLm42TmCqCMOZFvH4fcoSNKEW.jpg",
                        "provider_id": 10,
                        "provider_name": "Amazon Video",
                        "display_priority": 13
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 14
                    },
                    {
                        "logo_path": "/oIkQkEkwfmcG7IGpRR1NB8frZZM.jpg",
                        "provider_id": 192,
                        "provider_name": "YouTube",
                        "display_priority": 15
                    },
                    {
                        "logo_path": "/21dEscfO8n1tL35k4DANixhffsR.jpg",
                        "provider_id": 7,
                        "provider_name": "Vudu",
                        "display_priority": 42
                    },
                    {
                        "logo_path": "/shq88b09gTBYC4hA7K7MUL8Q4zP.jpg",
                        "provider_id": 68,
                        "provider_name": "Microsoft Store",
                        "display_priority": 53
                    },
                    {
                        "logo_path": "/gbyLHzl4eYP0oP9oJZ2oKbpkhND.jpg",
                        "provider_id": 279,
                        "provider_name": "Redbox",
                        "display_priority": 54
                    },
                    {
                        "logo_path": "/xL9SUR63qrEjFZAhtsipskeAMR7.jpg",
                        "provider_id": 358,
                        "provider_name": "DIRECTV",
                        "display_priority": 58
                    },
                    {
                        "logo_path": "/kJlVJLgbNPvKDYC0YMp3yA2OKq2.jpg",
                        "provider_id": 352,
                        "provider_name": "AMC on Demand",
                        "display_priority": 137
                    }
                ],
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 2
                    }
                ],
                "rent": [
                    {
                        "logo_path": "/5NyLm42TmCqCMOZFvH4fcoSNKEW.jpg",
                        "provider_id": 10,
                        "provider_name": "Amazon Video",
                        "display_priority": 13
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 14
                    },
                    {
                        "logo_path": "/oIkQkEkwfmcG7IGpRR1NB8frZZM.jpg",
                        "provider_id": 192,
                        "provider_name": "YouTube",
                        "display_priority": 15
                    },
                    {
                        "logo_path": "/21dEscfO8n1tL35k4DANixhffsR.jpg",
                        "provider_id": 7,
                        "provider_name": "Vudu",
                        "display_priority": 42
                    },
                    {
                        "logo_path": "/shq88b09gTBYC4hA7K7MUL8Q4zP.jpg",
                        "provider_id": 68,
                        "provider_name": "Microsoft Store",
                        "display_priority": 53
                    },
                    {
                        "logo_path": "/gbyLHzl4eYP0oP9oJZ2oKbpkhND.jpg",
                        "provider_id": 279,
                        "provider_name": "Redbox",
                        "display_priority": 54
                    },
                    {
                        "logo_path": "/xL9SUR63qrEjFZAhtsipskeAMR7.jpg",
                        "provider_id": 358,
                        "provider_name": "DIRECTV",
                        "display_priority": 58
                    }
                ]
            },
            "UY": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=UY",
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 33
                    }
                ]
            },
            "VE": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=VE",
                "buy": [
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 3
                    }
                ],
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 1
                    }
                ]
            },
            "ZA": {
                "link": "https://www.themoviedb.org/movie/10195-thor/watch?locale=ZA",
                "buy": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 2
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 3
                    }
                ],
                "rent": [
                    {
                        "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
                        "provider_id": 2,
                        "provider_name": "Apple TV",
                        "display_priority": 2
                    },
                    {
                        "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
                        "provider_id": 3,
                        "provider_name": "Google Play Movies",
                        "display_priority": 3
                    }
                ],
                "flatrate": [
                    {
                        "logo_path": "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg",
                        "provider_id": 337,
                        "provider_name": "Disney Plus",
                        "display_priority": 28
                    }
                ]
            }
        }
    }
    """.data(using: .utf8)!
}

var creditsData: Data {
    return """
    {
      "id": 493529,
      "cast": [
        {
          "adult": false,
          "gender": 2,
          "id": 62064,
          "known_for_department": "Acting",
          "name": "Chris Pine",
          "original_name": "Chris Pine",
          "popularity": 46.336,
          "profile_path": "/mi00EsvrAebidnEYK7LZxgbKYyH.jpg",
          "cast_id": 20,
          "character": "Edgin Darvis",
          "credit_id": "5fd7fee2420228003e38e9b5",
          "order": 0
        },
        {
          "adult": false,
          "gender": 1,
          "id": 17647,
          "known_for_department": "Acting",
          "name": "Michelle Rodriguez",
          "original_name": "Michelle Rodriguez",
          "popularity": 33.811,
          "profile_path": "/qsXG5kqxB4XdjLACVY8GXNW6Jfg.jpg",
          "cast_id": 21,
          "character": "Holga Kilgore",
          "credit_id": "60217388c5ada500407aac45",
          "order": 1
        },
        {
          "adult": false,
          "gender": 2,
          "id": 1628687,
          "known_for_department": "Acting",
          "name": "Regé-Jean Page",
          "original_name": "Regé-Jean Page",
          "popularity": 18.705,
          "profile_path": "/2NYvHjBlfVeY0gDJLaQXnw4Lfxm.jpg",
          "cast_id": 23,
          "character": "Xenk Yendar",
          "credit_id": "602c31affea0d70040312509",
          "order": 2
        },
        {
          "adult": false,
          "gender": 2,
          "id": 1029934,
          "known_for_department": "Acting",
          "name": "Justice Smith",
          "original_name": "Justice Smith",
          "popularity": 27.589,
          "profile_path": "/3UoUT44XYWoWNsZaqHzN3w48gZL.jpg",
          "cast_id": 22,
          "character": "Simon Aumar",
          "credit_id": "6021738d263462003bf8d432",
          "order": 3
        },
        {
          "adult": false,
          "gender": 1,
          "id": 1481238,
          "known_for_department": "Acting",
          "name": "Sophia Lillis",
          "original_name": "Sophia Lillis",
          "popularity": 48.468,
          "profile_path": "/pGwA6WnqlSEw9BpHzeWDKReWdls.jpg",
          "cast_id": 28,
          "character": "Doric",
          "credit_id": "603ebaa4c740d90056e1412f",
          "order": 4
        },
        {
          "adult": false,
          "gender": 2,
          "id": 3291,
          "known_for_department": "Acting",
          "name": "Hugh Grant",
          "original_name": "Hugh Grant",
          "popularity": 14.788,
          "profile_path": "/tUHkXYdwm405DjBm2IpPxGjYkjj.jpg",
          "cast_id": 27,
          "character": "Forge Fitzwilliam",
          "credit_id": "603eba8d0e29a20043a12d66",
          "order": 5
        },
        {
          "adult": false,
          "gender": 1,
          "id": 1696016,
          "known_for_department": "Acting",
          "name": "Chloe Coleman",
          "original_name": "Chloe Coleman",
          "popularity": 13.085,
          "profile_path": "/w4C3VBjmVFeMimbIeJm41fuPY9b.jpg",
          "cast_id": 29,
          "character": "Kira Darvis",
          "credit_id": "6080e1fc66f2d20057d521ce",
          "order": 6
        },
        {
          "adult": false,
          "gender": 1,
          "id": 1070886,
          "known_for_department": "Acting",
          "name": "Daisy Head",
          "original_name": "Daisy Head",
          "popularity": 37.398,
          "profile_path": "/5DcAwmYWDC7mvxMoceZIzcnpT2L.jpg",
          "cast_id": 44,
          "character": "Sofina the Red Wizard",
          "credit_id": "62d9bcda41eee100bd0e87df",
          "order": 7
        },
        {
          "adult": false,
          "gender": 0,
          "id": 3655420,
          "known_for_department": "Acting",
          "name": "Kyle Hixon",
          "original_name": "Kyle Hixon",
          "popularity": 0.6,
          "profile_path": "/jtAaYjNrqdvtXoXSpTuz9gDmEV.jpg",
          "cast_id": 83,
          "character": "Guard",
          "credit_id": "64545fddc044290122cc51bd",
          "order": 8
        },
        {
          "adult": false,
          "gender": 2,
          "id": 1033691,
          "known_for_department": "Acting",
          "name": "Jason Wong",
          "original_name": "Jason Wong",
          "popularity": 6.943,
          "profile_path": "/tt3D1PAoB8Yf4jPCovnhlP4pvL3.jpg",
          "cast_id": 32,
          "character": "Dralas",
          "credit_id": "609dabc35b370d00418976f1",
          "order": 9
        },
        {
          "adult": false,
          "gender": 2,
          "id": 51329,
          "known_for_department": "Acting",
          "name": "Bradley Cooper",
          "original_name": "Bradley Cooper",
          "popularity": 40.111,
          "profile_path": "/DPnessSsWqVXRbKm93PtMjB4Us.jpg",
          "cast_id": 53,
          "character": "Marlemin",
          "credit_id": "6417c553e7414600f7eec281",
          "order": 10
        },
        {
          "adult": false,
          "gender": 1,
          "id": 1137972,
          "known_for_department": "Acting",
          "name": "Hayley-Marie Axe",
          "original_name": "Hayley-Marie Axe",
          "popularity": 1.4,
          "profile_path": "/7P7LSTBkvrh0MFTQVmfHfIYcfuV.jpg",
          "cast_id": 55,
          "character": "Gwinn",
          "credit_id": "6417c6ca5690b50084e09102",
          "order": 11
        },
        {
          "adult": false,
          "gender": 2,
          "id": 3076,
          "known_for_department": "Acting",
          "name": "Ian Hanmore",
          "original_name": "Ian Hanmore",
          "popularity": 3.705,
          "profile_path": "/yhI4MK5atavKBD9wiJtaO1say1p.jpg",
          "cast_id": 56,
          "character": "Szass Tam",
          "credit_id": "6417c6ea2b8a4300d7948246",
          "order": 12
        },
        {
          "adult": false,
          "gender": 2,
          "id": 997569,
          "known_for_department": "Acting",
          "name": "Kenneth Collard",
          "original_name": "Kenneth Collard",
          "popularity": 5.102,
          "profile_path": "/xUMUdN52gCIRjHzUc1uw1F0ZAfz.jpg",
          "cast_id": 58,
          "character": "Din Caldwell",
          "credit_id": "6417c7112b8a4300f68e498c",
          "order": 13
        },
        {
          "adult": false,
          "gender": 0,
          "id": 2272527,
          "known_for_department": "Crew",
          "name": "Richie Wilson",
          "original_name": "Richie Wilson",
          "popularity": 0.6,
          "profile_path": "/fupLzCf0GkZ36O7BOuMk3swILZg.jpg",
          "cast_id": 59,
          "character": "Toke Horgath",
          "credit_id": "6417c734e9c0dc007b9a08c4",
          "order": 14
        },
        {
          "adult": false,
          "gender": 2,
          "id": 208470,
          "known_for_department": "Acting",
          "name": "Philip Brodie",
          "original_name": "Philip Brodie",
          "popularity": 4.244,
          "profile_path": "/1S4hzhYjgMRfjCNmJ2VCSij20hF.jpg",
          "cast_id": 60,
          "character": "Stanhard Grimwulf",
          "credit_id": "6417c74b6a222700e975f130",
          "order": 15
        },
        {
          "adult": false,
          "gender": 2,
          "id": 1839178,
          "known_for_department": "Acting",
          "name": "Michael Redmond",
          "original_name": "Michael Redmond",
          "popularity": 0.6,
          "profile_path": "/hIzvbXeBeUn5uLYHObYnpUz3yjg.jpg",
          "cast_id": 61,
          "character": "Sven Salafin",
          "credit_id": "6417c76b5690b5007a5516d7",
          "order": 16
        },
        {
          "adult": false,
          "gender": 0,
          "id": 2143410,
          "known_for_department": "Acting",
          "name": "Daniel Campbell",
          "original_name": "Daniel Campbell",
          "popularity": 0.6,
          "profile_path": null,
          "cast_id": 62,
          "character": "Ven Salafin",
          "credit_id": "6417c77e310325008efd4f7b",
          "order": 17
        },
        {
          "adult": false,
          "gender": 1,
          "id": 2292713,
          "known_for_department": "Acting",
          "name": "Sharon Blynn",
          "original_name": "Sharon Blynn",
          "popularity": 1.96,
          "profile_path": "/m3lzrdrNc0lleW9Tva64flZ8Fah.jpg",
          "cast_id": 63,
          "character": "Dimitra Flass",
          "credit_id": "6417c796e74146007c828188",
          "order": 18
        },
        {
          "adult": false,
          "gender": 2,
          "id": 3232669,
          "known_for_department": "Acting",
          "name": "Jude Hill",
          "original_name": "Jude Hill",
          "popularity": 2.553,
          "profile_path": "/hKPl5S2ROF9wW3Bu4QNgn9TIEbz.jpg",
          "cast_id": 64,
          "character": "Boy in Stands",
          "credit_id": "6417c7a32b8a43007b789be6",
          "order": 19
        },
        {
          "adult": false,
          "gender": 1,
          "id": 2959201,
          "known_for_department": "Acting",
          "name": "Niamh McCormack",
          "original_name": "Niamh McCormack",
          "popularity": 1.119,
          "profile_path": "/o1wI4J65Tz6WX5SZclTt2jiA5Wg.jpg",
          "cast_id": 65,
          "character": "Rogue Contestant",
          "credit_id": "6417c7ca5690b500a217d452",
          "order": 20
        }
      ]
    }
    """.data(using: .utf8)!
}

// swiftlint:enable line_length file_length
