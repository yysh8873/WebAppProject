<%--
  Created by IntelliJ IDEA.
  User: 이소현
  Date: 2020-04-23
  Time: 오전 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Deeper - 소개</title>

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="resources/assets/materialize/css/materialize.min.css" media="screen,projection" />
    <!-- Bootstrap Styles-->
    <link href="resources/assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="resources/assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->
    <link href="resources/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="resources/assets/css/custom-styles.css" rel="stylesheet" />
    <link href="resources/assets/css/custom-styles2.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="resources/assets/js/Lightweight-Chart/cssCharts.css">
</head>
<body>
<div id="wrapper">
    <%@ include file="/header.jsp" %>

    <!-- /. NAV SIDE  -->
    <div id="page-wrapper">
        <div class="header">
            <h1 class="page-header">
                Deeper <small>개발자들을 위한 SNS</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li><a href="#">추천</a></li>
                <li class="active">통합 개발 도구 추천</li>
            </ol>

        </div>
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-action">
                            개발도구 추천
                        </div>

                        <div class="row">
                            <div class="col-md-4 col-sm-4">
                                <div class="card">
                                    <div class="card-image waves-effect waves-block waves-light">
                                        <img class="activator" src="https://ifh.cc/g/bv0YNW.jpg">
                                    </div>
                                    <div class="card-content">
                                        <span class="card-title activator grey-text text-darken-4">Eclipse<i class="material-icons right">more_vert</i></span>
                                        <p><a href="https://www.eclipse.org/">This is a link</a></p>
                                    </div>
                                    <div class="card-reveal">
                                        <span class="card-title grey-text text-darken-4">Eclipse<i class="material-icons right">close</i></span>
                                        <p>Eclipse Foundation은 전 세계 개인 및 조직 커뮤니티에 오픈 소스 소프트웨어 협업 및 혁신을위한 성숙하고 확장 가능하며 상업적으로 친화적 인 환경을 제공합니다.</p>
                                        <p>이클립스(영어: Eclipse)는 다양한 플랫폼에서 쓸 수 있으며, 자바를 비롯한 다양한 언어를 지원하는 프로그래밍 통합 개발 환경을 목적으로 시작하였으나, 현재는 OSGi를 도입하여, 범용 응용 소프트웨어 플랫폼으로 진화하였다.

                                            자바로 작성되어 있으며, 자유 소프트웨어이지만 막강한 기능을 자랑한다. 2004년과 2005년 졸트 어워드(Jolt Award)를 수상했다.

                                            식(蝕)을 뜻하는 이클립스란 이름은 자바를 개발한 회사의 SUN(재단)이란 이름을 염두에 두었다는 말도 있어 2003년도에 썬 마이크로시스템즈는 이클립스 재단에 참여하지 않았던 이유 중의 하나였지만 2005년도에 열린 EclipseCon의 키노트에서 Lee Nackman은 그 목적은 원래 마이크로소프트와 비주얼 스튜디오 생태 시스템을 겨냥한 것이었다고 말했다. [3]

                                            원래 IBM의 웹스피어 스튜디오 애플리케이션 디밸로퍼(WebSpheare Studio Application Developer)란 이름으로 개발되었던 것인데, 엔진부분을 오픈소스로 공개한 것을 기반으로 지금의 이클립스로 발전해 왔다.

                                            최근 버전은 4.6.2이며 (C/C++ 개발자용, 자바 개발자용, 웹 개발자용 등등) 다양한 배포판이 존재한다.</p>
                                        <p></p>
                                        <p>출처: 위키백과</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-4">
                                <div class="card">
                                    <div class="card-image waves-effect waves-block waves-light">
                                        <img class="activator" src="https://ifh.cc/g/sSlY6r.png">
                                    </div>
                                    <div class="card-content">
                                        <span class="card-title activator grey-text text-darken-4">VS Code<i class="material-icons right">more_vert</i></span>
                                        <p><a href="https://code.visualstudio.com/">This is a link</a></p>
                                    </div>
                                    <div class="card-reveal">
                                        <span class="card-title grey-text text-darken-4">VS Code<i class="material-icons right">close</i></span>
                                        <p>Microsoft의 Visual Studio Code 는 OS-X, Linux 및 Windows에서 기본적으로 실행 되는 무료 이고 재정 의 된 크로스 플랫폼 코드 편집기</p>
                                        <p>Visual Studio Code 는 최신 웹 및 클라우드 응용 프로그램 개발에 최적화 되어 있으므로 JavaScript, TypeScript, Node를위한 추가 도구를 제공</p>
                                        <p>마이크로소프트가 마이크로소프트 윈도우, macOS, 리눅스용으로 개발한 소스 코드 편집기이다. 디버깅 지원과 Git 제어, 구문 강조 기능등이 포함되어 있으며, 사용자가 편집기의 테마와 단축키, 설정 등을 수정할 수 있다.

                                            비주얼 스튜디오 코드는 깃허브가 개발한 일렉트론 프레임워크를 기반으로 구동된다.[4] 그러나 같은 일렉트론 기반의 편집기 아톰을 포크한 것은 아니며, 비주얼 스튜디오 온라인 에디터(코드명 "모나코")를 기반으로 개발되었다.</p>
                                        <p></p>
                                        <p>출처: 위키백과</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-4">
                                <div class="card">
                                    <div class="card-image waves-effect waves-block waves-light">
                                        <img class="activator" src="https://ifh.cc/g/QHjI03.png">
                                    </div>
                                    <div class="card-content">
                                        <span class="card-title activator grey-text text-darken-4">IntelliJ<i class="material-icons right">more_vert</i></span>
                                        <p><a href="https://www.jetbrains.com/idea/">This is a link</a></p>
                                    </div>
                                    <div class="card-reveal">
                                        <span class="card-title grey-text text-darken-4">IntelliJ<i class="material-icons right">close</i></span>
                                        <p>IntelliJ IDEA가 소스 코드를 인덱싱 한 후에는 즉각적이고 영리한 코드 완성, 즉각적인 코드 분석 및 안정적인 리팩토링 도구와 같은 모든 상황에서 관련 제안을 제공하여 빠르고 지능적인 경험을 제공합니다.</p>
                                        <p> JetBrains사에서 제작한 상용 자바 통합 개발 환경이다. 줄여서 IntelliJ 혹은 IDEA로도 불린다.

                                            이클립스 재단 의 이클립스와 썬 마이크로시스템즈의 넷빈즈로 대표되는 무료 자바 통합개발환경에서 볼랜드(/코드기어)의 제이빌더(JBuilder)와 함께 얼마 안 되는 상용 개발 도구 가운데 하나이다.</p>
                                        <p></p>
                                        <p>출처: 위키백과</p>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-4 col-sm-4">
                                <div class="card">
                                    <div class="card-image waves-effect waves-block waves-light">
                                        <img class="activator" src="https://ifh.cc/g/zQQqI7.jpg">
                                    </div>
                                    <div class="card-content">
                                        <span class="card-title activator grey-text text-darken-4">Visual studio<i class="material-icons right">more_vert</i></span>
                                        <p><a href="https://www.visualstudio.com/">This is a link</a></p>
                                    </div>
                                    <div class="card-reveal">
                                        <span class="card-title grey-text text-darken-4">Visual studio<i class="material-icons right">close</i></span>
                                        <p> 마이크로소프트 윈도우에서 작동하며, 다양한 언어로 프로그래밍할 수 있는 마이크로소프트의 통합 개발 환경이다. 프로그램, 웹 사이트, 웹 프로그램 등을 개발할 수 있다. 마이크로소프트에서는 비주얼 베이직, 비주얼 C#, 비주얼 J# 등 특정한 언어로만 프로그래밍할 수 있는 언어별 버전도 제공하고 있다.</p>
                                        <p></p>
                                        <p>출처: 위키백과</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-4">
                                <div class="card">
                                    <div class="card-image waves-effect waves-block waves-light">
                                        <img class="activator" src="https://ifh.cc/g/aY5YwA.png">
                                    </div>
                                    <div class="card-content">
                                        <span class="card-title activator grey-text text-darken-4">Xcode<i class="material-icons right">more_vert</i></span>
                                        <p><a href="https://developer.apple.com/kr/xcode/">This is a link</a></p>
                                    </div>
                                    <div class="card-reveal">
                                        <span class="card-title grey-text text-darken-4">Xcode<i class="material-icons right">close</i></span>
                                        <p>애플이 개발한 OS X의 개발 툴 모음이다. 3.2 버전은 맥 OS X 10.6에 포함되어 있으나 자동으로 설치되지는 않는다. 이전의 버전의 맥 OS X에서는 3.2를 지원하지 않기 때문에 옛 버전을 Apple Developer Connection에서 무료로 받을 수 있다.

                                            엑스코드의 주 프로그램은 같은 이름의 통합 개발 환경이다. 여기에는 애플 개발자 문서와 그래픽 인터페이스를 만드는 데 쓰는 인터페이스 빌더가 포함되어 있다.

                                            엑스코드는 자유 소프트웨어인 GCC의 수정된 버전(GCC, apple-darwin9-gcc-4.2.1, apple-darwin9-gcc-4.0.1)을 포함하고 있고 코코아, 카본, 자바에 대한 다양한 프로그래밍 모델을 포함하여 C, C++, 포트란, 오브젝티브-C, 오브젝티브-C++,스위프트, 자바, 애플스크립트, 파이썬, 루비를 지원한다. 서드 파티로 GNU 파스칼, 프리 파스칼, 에이다, C 샤프, 펄, 하스켈, D를 지원한다. 엑스코드는 디버거의 백엔드로 GDB를 사용한다.</p>
                                        <p></p>
                                        <p>출처: 위키백과</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-4">
                                <div class="card">
                                    <div class="card-image waves-effect waves-block waves-light">
                                        <img class="activator" src="https://ifh.cc/g/7xX19E.png">
                                    </div>
                                    <div class="card-content">
                                        <span class="card-title activator grey-text text-darken-4">Jetbrains series<i class="material-icons right">more_vert</i></span>
                                        <p><a href="https://www.jetbrains.com">This is a link</a></p>
                                    </div>
                                    <div class="card-reveal">
                                        <span class="card-title grey-text text-darken-4">Jetbrains series<i class="material-icons right">close</i></span>
                                        <p>체코의 프라하에 설립된 소프트웨어, 프로그래밍 언어, 그리고 솔루션을 개발 및 공급하는 기업이다.
                                            IDE를 만드는 기업으로 유명하다.Java, C/C++, IOS, Database, PHP, Ruby, Go, javascript, Python 등
                                            다양한 개발 언어를 지원하는 IDE가 있습니다. 각각의 언어에 대한 프로그램이 각각 따로 있기 때문에 용량을 많이 차지,
                                            jetbrains의 IDE들은 모두 Java로 짜여 있으며 그렇기 때문에 좀 무거운 느낌이 있습니다.

                                            그래도 수준 높은 자동 완성 기능과 다양한 플러그인들이 있기 때문에 기능면에서는 완성도가 굉장히 높고
                                            특히 Eclipse와 함께 jetbrain사에서 개발한 Java IDE인 intelliJ는 많은 사람들에게 사랑받는 Java IDE라고 할 수 있다.
                                            그리고 무엇보다 jetbrain사가 kotlin을 개발한 회사이기 때문에 kotlin support면에서 뛰어나다고 볼 수 있다.
                                            다양한 단축키를 효율적으로 제공, 마우스를 거의 쓰지 않고 개발할 수 있는 IDE, JetBrains의 모든 IDE 제품이 무료로 제공되고, 기능상의 제약은 없으며
                                            얼티밋 에디션과 일반 에디션으로 나눠진 IDE가 있다면 얼티밋 에디션이 제공된다.</p>

                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
                <!-- /. PAGE INNER  -->
            </div>
            <!-- /. PAGE WRAPPER  -->
        </div>
    </div>
        <!-- /. WRAPPER  -->
        <!-- JS Scripts-->
        <!-- jQuery Js -->
        <script src="resources/assets/js/jquery-1.10.2.js"></script>

        <!-- Bootstrap Js -->
        <script src="resources/assets/js/bootstrap.min.js"></script>

        <script src="resources/assets/materialize/js/materialize.min.js"></script>

        <!-- Metis Menu Js -->
        <script src="resources/assets/js/jquery.metisMenu.js"></script>
        <!-- Custom Js -->
        <script src="resources/assets/js/custom-scripts.js"></script>



</body>

</html>
