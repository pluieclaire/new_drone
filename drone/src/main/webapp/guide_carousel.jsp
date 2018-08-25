<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootsrap CDN -->
        <!-- 링크를 통해 서버로 부터 파일을 받아오는 cdn 방식으로 -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" ></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

        <title>Guide</title>
        <style>
       html,
        body {
        height: 80%;  /*이 height로 전체 크기 조절 가능*/
        padding: 0;
        margin: 0;
        }

        body {
        background: #fff;
        font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
        }
        
        .js-transitions-disabled * {  /*자바스크립트에서 정의되어있는 const함수 클래스*/
        transition: none !important;
        }

        /* 캐러셀 */
        .carousel {
        position: relative;
        height: 100%;
        overflow: hidden;
         /* -webkit-perspective: 50vw; 
          perspective: 50vw;
        -webkit-perspective-origin: 50% 50%;
          perspective-origin: 50% 50%;  */
        }

        .carousel__control { /*캐러셀 넘기는 버튼상자 크기&색상*/
        position: absolute;
        height: 160px;
        width: 40px;
        background: #fff;
        right: 0;
        top: 0;
        bottom: 0;
        margin: auto;
        z-index: 1;
        }
        .carousel__control a {  /*버튼상자 안에 점들 조정*/
        position: relative;
        display: block;
        width: 100%;
        padding-top: 75%;
        box-sizing: border-box;
        }
        .carousel__control a:hover:before { /* 링크에 마우스 포인터를 올려 놓았을 때 */
        background-color: rgba(0,0,0,0.4);
        }
        .carousel__control a.active:before,  /*링크를 마우스로 클릭한 순간*/
        .carousel__control a.active:hover:before { 
        background-color: rgba(0,0,0,0.6);
        }
        .carousel__control a:first-child { /*버튼상자 안에 첫번째 점 색깔/ 없애면 점들 사라짐*/
        margin-top: 15px;
        /* background-color: rgb(231, 52, 52); */
        }
        .carousel__control a:before { /*버튼상자 안에 점들의 모든 위치조정 & 색조정*/
        position: absolute;
        top: 50%;
        left: 0;
        right: 0;
        margin: auto;
        border-radius: 50%;
        padding-top: 25%;
        width: 25%;
        background: #eddcf4;
        content: '';
        display: block;
        margin-top: -12.5%;
        }
        .carousel__stage { /*left&right div의 사이즈를 한 번에 조정가능*/
        position: absolute;
        top: 20px;
        bottom: 20px;
        left: 20px;
        right: 20px;
        margin: auto;
        /* -webkit-transform-style: preserve-3d;
          transform-style: preserve-3d;
        -webkit-transform: translateZ(calc(-50vh + 20px));
          transform: translateZ(calc(-50vh + 20px)); */
        }

        .spinner { /*얘도 left&right div의 사이즈 조정가능 / 그냥 스피너시끼는 건들이지 말고 나중에확인...*/
        position: absolute;
        width: calc(50vw - (20px));
        height: calc(100vh - 40px);
        top: 0;
        left: 0;
        right: auto;
        bottom: 0;
        margin: auto;
        -webkit-transform-style: preserve-3d; /*애니메이션 효과만드는 곳*/
          transform-style: preserve-3d;
        transition: -webkit-transform 1s; /*애니메이션 시간초*/
        transition: transform 1s;
        transition: transform 1s, -webkit-transform 1s;
        /*애니메이션 효과 상세조절가능*/
       -webkit-backface-visibility: hidden;
                backface-visibility: hidden;
        -webkit-transform-origin: 50% 50%;
                transform-origin: 50% 50%;
        -webkit-transform: rotateX(0);
                transform: rotateX(0); 
        }
        .js-spin-fwd .spinner {
        -webkit-transform: rotateX(-90deg);
                transform: rotateX(-90deg);
        }
        .js-spin-bwd .spinner {
        -webkit-transform: rotateX(90deg);
                transform: rotateX(90deg);
        }
        .js-spin-fwd .spinner--right {
        -webkit-transform: rotateX(90deg);
                transform: rotateX(90deg);
        }
        .js-spin-bwd .spinner--right {
        -webkit-transform: rotateX(-90deg);
                transform: rotateX(-90deg);
        }
        .spinner--right { /* right: 100;을 주니 레프트와 한몸으로 합쳐짐*/
        right: 0;
        left: auto;
        }
        .spinner__face {
        display: none;
        position: absolute;
        width: 100%;
        height: 100%;
        overflow: hidden;
        }
        .spinner__face.js-next {
        display: block;
        -webkit-transform: rotateX(90deg) translateZ(calc(50vh - 20px));
                transform: rotateX(90deg) translateZ(calc(50vh - 20px));
        }
        .spinner--right .spinner__face.js-next {
        -webkit-transform: rotateX(270deg) translateZ(calc(50vh - 20px));
                transform: rotateX(270deg) translateZ(calc(50vh - 20px));
        }
        .js-spin-bwd .spinner__face.js-next {
        -webkit-transform: rotateX(-90deg) translateZ(calc(50vh - 20px));
                transform: rotateX(-90deg) translateZ(calc(50vh - 20px));
        }
        .js-spin-bwd .spinner--right .spinner__face.js-next {
        -webkit-transform: rotateX(-270deg) translateZ(calc(50vh - 20px));
                transform: rotateX(-270deg) translateZ(calc(50vh - 20px));
        }
        .js-active {
        display: block;
        -webkit-transform: translateZ(calc(50vh - 20px));
                transform: translateZ(calc(50vh - 20px));
        }
        
        .content {
        position: absolute;
        width: 200%;
        height: 100%;
        left: 0;
        }
        .spinner--right .content {
        left: -100%;
        }

        /* left&right 둘다 적용되는 곳 */
        .content__left,
        .content__right {
        position: absolute;
        left: 0;
        top: 0;
        width: 50%;     /* 이 width로 반으로 나눠진다. */
        height: 100%;
        }

        .content__right {
        right: 0;
        left: auto;
        }

        /* left - 그림들어가는 곳 */
        .content__left { 
        background-repeat: no-repeat;
        background-size: cover;
        }

         .content__left:after {  /* after 속성 / after 없을시 막 글자 날라가고 그럼 */
        position: absolute;
        display: block;
        content: "";
        width: 100%;
        height: 100%;
        /* background-color: #fff; */
        background-color: rgba(0,0,0,0.1);
        } 
        
        .content__left h1 { /* left 큰 글자 */
        position: absolute;
        top: 50%;
        margin-top: -3vw;
        text-align: center;
        font-family: oswald;
        font-size: 5vw;
        height: 10vw;
        opacity: 1;
        color: #fff;
        width: 100%;
        letter-spacing: 0.15em;
        line-height: 0.6;
        }
        .content__left span { /* left 작은 글자 */
        font-size: 1vw;
        font-weight: 300;
        letter-spacing: 0.2em;
        opacity: 0.9;
        font-family: Merriweather;
        }

        /* right 부분 글& 페이지숫자 */
        .content__right {  /* 전체 right */
        display: flex;
        align-items: center;
        justify-content: center;
        }

        .content__right .content__main { /* 오른쪽 설명 글자박스 */
        padding: 0px;    

        position: absolute;
        font-family: Merriweather, serif;
        text-align: left;
        color: #fff;
        font-size: 1.3vw;
        padding: 0 8vw;
        line-height: 1.65;
        font-weight: 300;
        margin: 0;
        opacity: 0.8;
        }

        .content__right .content__main p:first-child { /* 글자 p 태그 본문 스타일 */
        text-transform: uppercase;
        letter-spacing: 0.15em;
        font-size: 0.85em;
        font-family: oswald;
        color: #fff;
        }

        .content__right .content__main p:last-child { /* 글자 p 태그 제목? 스타일  나중에 없애거나 하기, 아님 순서바꿔놓기*/
        text-transform: uppercase;
        letter-spacing: 0.15em;
        font-size: 0.85em;
        font-family: oswald;
        color: #fff;
        }

        .content__right .content__index { /* 페이지 숫자 스타일 */
        font-size: 30vh;
        position: absolute;
        right: -1vh;
        top: 35vh;
        opacity: 0.04;
        font-family: oswald;
        color: #fff;
        }

        #p_1{ /*p 태그 조절*/
         width: 800px;
         height: 400px; 
         /* text-align: center; */
         padding-top: 70px;
         padding-left: 120px;
        }
 

        #p_2{ /*p 태그 조절*/
         width: 800px;
         height: 400px; 
         /* text-align: center; */
         padding-top: 55px;
         padding-left: 120px;
        }

         #iceland {
            padding-right: 400px;
        }   


        /* 그림 불러오기 */
        [ id="#iceland" ] .content__left { /*큰 제목은 왼쪽에 써주기*/
         /* background-image: url("https://www.anadronestarting.com/wp-content/cdn/prohibit-all.png"); */
            background-image: url("1.png"); 
        } 
        /* background-image: url("1.png"); */
        .spinner--right [id="#iceland"] .content__left { 
        background-image: none;
        }  /*주석줘도 상관없으나 나중에 테스트해보기*/

        [data-type="china"] .content__left {
        /* background-image: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/215059/china.jpg"); */
        background-image: url("2.jpg");
        }
        .spinner--right [data-type="china"] .content__left {
        background-image: none;
        }

        /* [data-type="usa"] .content__left {
        background-image: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/215059/usa.jpg");
        }
        .spinner--right [data-type="usa"] .content__left {
        background-image: none;
        }

        [data-type="peru"] .content__left {
        background-image: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/215059/peru.jpg");
        }
        .spinner--right [data-type="peru"] .content__left {
        background-image: none;
        } */

            
        </style>
    </head>  

<body>
        <div class="carousel">
            <div class="carousel__control">
            </div>
            <div class="carousel__stage">

                <div class="spinner spinner--left">

                    <div class="spinner__face js-active" data-bg="#27323c">
                        <div class="content" id="#iceland">
                            <div class="content__left" id="left1">
                                <h1>비행금지구역<br><span></span></h1>
                            </div>
                            <div class="content__right">
                                <div class="content__main">
                                  <P id="p_1">*항공법상 비행금지구역 (2015.5.30기준)<br>
                                        1. 서울시 대부분, 휴전선 인근, 기타 지정된 비행금지구역<br>
                                        2. 전국 비행장(민간공항, 군공항) 반경 9.3km 이내<br>
                                        3. 모든 지역에서 150m 이상의 고도<br>
                                        4. 모든 지역에서 인구밀집지역 또는 사람이 많이 모인 곳의 상공
                                  </P>
                                </div>
                                <h3 class="content__index">01</h3>
                            </div>
                        </div>
                    </div>

                    <div class="spinner__face" data-bg="#19304a">
                        <div class="content" data-type="china">
                            <div class="content__left">
                                <h1>필수체크<!--<<br><span>ASIA</span>--></h1>
                            </div>
                            <div class="content__right">
                                <div class="content__main">
                                    <P id="p_2"><br>
                                        1. 비행시간 : 일몰 후 부터 일출 전까지 야간비행금지<br>
                                        2. 비행장소 : 비행금지구역, 관제권에서 비행금지<br>
                                        3. 비행고도 : 150m이상의 고도로 비행금지 <br>
                                        4. 조종거리 : 눈으로 드론을 식별할 수 있는 거리에서 비행<br>
                                        5. 비행에티켓 : 사람들이 많이 모인 상공에서의 비행금지<br>
 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 인명, 재산 피해 유발할 수 있는 낙하물 투하 금지<br>
 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 음주비행금지!<br>
                                        6. 비행관련 정부승인 : 항공촬영 허가와 비행승인은 별도<br>
                                        7. 비행 전 세팅 : 배터리 잔량과 통신상태에 대한 점검 필수 <br>                                                                                            
                                  </P>
                                </div>
                                <h3 class="content__index">02</h3>
                            </div>
                        </div>
                    </div>

                    <!-- <div class="spinner__face" data-bg="#2b2533">
                        <div class="content" data-type="usa">
                            <div class="content__left">
                                <h1>USA<br><span>NORTH AMERICA</span></h1>
                            </div>
                            <div class="content__right">
                                <div class="content__main">
                                    <p>“When it comes to travel, America has always floored me with its staggering range of possibilities. Not many other countries have so much natural beauty – mountains, beaches, rainforest, deserts, canyons, glaciers – coupled with fascinating cities to explore, an unrivaled music scene and all the things that make travel so rewarding (friendly locals, great restaurants and farmers markets, and plenty of quirky surprises).” </p>
                                  <p>– Regis St Louis</p>
                                </div>
                                <h3 class="content__index">03</h3>
                            </div>
                        </div>
                    </div>

                    <div class="spinner__face" data-bg="#312f2d">
                        <div class="content" data-type="peru">
                            <div class="content__left">
                                <h1>PERU<br><span>SOUTH AMERICA</span></h1>
                            </div>
                            <div class="content__right">
                                <div class="content__main">
                                    <p>“For me, Peru is the molten core of South America, a distillation of the oldest traditions and the finest building, weaving and art made by the most sophisticated cultures on the continent. In Peru the wildest landscapes – from frozen Andean peaks to the deep Amazon – help us re-forge our connection to the natural world. It is also a cultural stew, where diverse peoples live side by side, negotiating modern life with humor and aplomb. Beyond that, the cuisine alone makes it worth the trip. Every return is rich and surprising.”</p>
                                  <p>– Carolyn McCarthy</p>
                                </div>
                                <h3 class="content__index">04</h3>
                            </div>
                        </div>
                    </div> -->

                </div> 
                <!-- spinner spinner--left -->

            </div>
        </div>
    

    <script>
        // let & const는 함수선언 방식 / var 보다는 엄격

        let activeIndex = 0
        let limit = 0
        let disabled = false
        let $stage
        let $controls
        let canvas = false

        const SPIN_FORWARD_CLASS = 'js-spin-fwd'
        const SPIN_BACKWARD_CLASS = 'js-spin-bwd'
        const DISABLE_TRANSITIONS_CLASS = 'js-transitions-disabled'
        const SPIN_DUR = 1000

        const appendControls = () => {
        for (let i = 0; i < limit; i++) {
            $('.carousel__control').append(`<a href="#" data-index="${i}"></a>`)
        }
        let height = $('.carousel__control').children().last().outerHeight()
        
        $('.carousel__control').css('height', (30 + (limit * height)))
        $controls = $('.carousel__control').children()
        $controls.eq(activeIndex).addClass('active')
        }

        const setIndexes = () => {
            $('.spinner').children().each((i, el) => {
                $(el).attr('data-index', i)
                limit++
            })
        }

        const duplicateSpinner = () => {
            const $el = $('.spinner').parent()
            const html = $('.spinner').parent().html()
            $el.append(html)
            $('.spinner').last().addClass('spinner--right')
            $('.spinner--right').removeClass('spinner--left')
        }

        const paintFaces = () => {
            $('.spinner__face').each((i, el) => {
                const $el = $(el)
                let color = $(el).attr('data-bg')
                $el.children().css('backgroundImage', `url(${getBase64PixelByColor(color)})`)
            })
        }

        const getBase64PixelByColor = (hex) => {
            if (!canvas) {
                canvas = document.createElement('canvas')
                canvas.height = 1
                canvas.width = 1
            }
            if (canvas.getContext) {
                const ctx = canvas.getContext('2d')
                ctx.fillStyle = hex
                ctx.fillRect (0, 0, 1, 1)
                return canvas.toDataURL()
            }
            return false
        }

        const prepareDom = () => {
            setIndexes()
            paintFaces()
            duplicateSpinner()
            appendControls()
        }

        const spin = (inc = 1) => {
            if (disabled) return
            if (!inc) return
            activeIndex += inc
            disabled = true

            if (activeIndex >= limit) {
                activeIndex = 0
            }
        
            if (activeIndex < 0) {
                activeIndex = (limit - 1)
            }

            const $activeEls = $('.spinner__face.js-active')
            const $nextEls = $(`.spinner__face[data-index=${activeIndex}]`)
            $nextEls.addClass('js-next')
        
            if (inc > 0) {
            $stage.addClass(SPIN_FORWARD_CLASS)
            } else {
            $stage.addClass(SPIN_BACKWARD_CLASS)
            }
            
            $controls.removeClass('active')
            $controls.eq(activeIndex).addClass('active')
        
            setTimeout(() => {
                spinCallback(inc)
            }, SPIN_DUR, inc)
        }

        const spinCallback = (inc) => {
            
            $('.js-active').removeClass('js-active')
            $('.js-next').removeClass('js-next').addClass('js-active')
            $stage
                .addClass(DISABLE_TRANSITIONS_CLASS)
                .removeClass(SPIN_FORWARD_CLASS)
                .removeClass(SPIN_BACKWARD_CLASS)
        
            $('.js-active').each((i, el) => {
                const $el = $(el)
                $el.prependTo($el.parent())
            })
            setTimeout(() => {
                $stage.removeClass(DISABLE_TRANSITIONS_CLASS)
                disabled = false
            }, 100)

        }

        const attachListeners = () => {
        
            document.onkeyup = (e) => {
                switch (e.keyCode) {
                    case 38:
                        spin(-1)
                        break
                    case 40:
                        spin(1)
                        break
                    }
            }
        
            $controls.on('click', (e) => {
            e.preventDefault()
            if (disabled) return
            const $el = $(e.target)
            const toIndex = parseInt($el.attr('data-index'), 10)
            spin(toIndex - activeIndex)
            
            })
        }

        const assignEls = () => {
            $stage = $('.carousel__stage')
        }

        const init = () => {
            assignEls()
            prepareDom()
            attachListeners()
        }


        $(() => {
            init();
        });
    </script>
</body>
</html>    
      