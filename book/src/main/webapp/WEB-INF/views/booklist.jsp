<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
    
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--  
    Document Title
    =============================================
    -->
    <title>Titan | Multipurpose HTML5 Template</title>
    <!--  
    Favicons
    =============================================
    -->
    <link rel="apple-touch-icon" sizes="57x57" href="assets/images/favicons/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="assets/images/favicons/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="assets/images/favicons/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="assets/images/favicons/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="assets/images/favicons/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="assets/images/favicons/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="assets/images/favicons/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="assets/images/favicons/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="assets/images/favicons/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="assets/images/favicons/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="assets/images/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="assets/images/favicons/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicons/favicon-16x16.png">
    <link rel="manifest" href="/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="assets/images/favicons/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <!--  
    Stylesheets
    =============================================
    
    -->
    <!-- Default stylesheets-->
    <link href="assets/lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Template specific stylesheets-->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Volkhov:400i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
    <link href="assets/lib/animate.css/animate.css" rel="stylesheet">
    <link href="assets/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="assets/lib/et-line-font/et-line-font.css" rel="stylesheet">
    <link href="assets/lib/flexslider/flexslider.css" rel="stylesheet">
    <link href="assets/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="assets/lib/owl.carousel/dist/assets/owl.theme.default.min.css" rel="stylesheet">
    <link href="assets/lib/magnific-popup/dist/magnific-popup.css" rel="stylesheet">
    <link href="assets/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet">
    <!-- Main stylesheet and color file-->
    <link href="assets/css/style.css" rel="stylesheet">
    <link id="color-scheme" href="assets/css/colors/default.css" rel="stylesheet">
    <link href="../css/booklist.css" rel="stylesheet">
    <script type="text/javascript">
    
    window.onload = function() {
   
     //카테고리 선택하면 페이지 바로이동
      var selectElement = document.querySelector("select[name='bkcate']");
      var currentBkcate = getUrlParameter('bkcate');
      if (currentBkcate) {
        selectElement.value = currentBkcate;
      }
      
      //카테고리 유지
      var searchN = document.getElementById("searchN");
      var searchNvalue = getUrlParameter('searchN');
      if (searchNvalue) {
    	  searchN.value = searchNvalue;
      }
      
     //검색값 유지
      var searchV = document.getElementById("searchV");
      var searchVvalue = getUrlParameter('searchV');
      if (searchVvalue) {
    	  searchV.value = searchVvalue;
      }
      
    };

    function getUrlParameter(name) {
      name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
      var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
      var results = regex.exec(location.search);
      return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
    }

    function rePage(selectElement) {
      var selectedValue = selectElement.value;
        var url = './booklist?bkcate=' + selectedValue;
        window.location.href = url;
    }
    

    </script>
  </head>
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
  <%@ include file="menu.jsp"%>
    <main>
      <div class="page-loader">
        <div class="loader">Loading...</div>
      </div>

      <div class="main">
       <%
        String[] bpimgs = {"bp1.jpg", "bp2.jpg", "bp3.jpg", "bp4.jpg"};
        %>
       <hr class="divider-w">
          <div class="container">
            <div class="row" style="margin-top: 60px; margin-bottom: 15px">
              <div class="owl-carousel text-center" data-items="1" data-pagination="false" data-navigation="false">
             <% for (String bpimg : bpimgs) { %>
                <div class="owl-item">
                  <div class="col-sm-12">
                    <img src="../img/page/<%= bpimg %>" alt="이미지"  style="border-radius:20px;"/>
                  </div>
                </div>
               <% } %>
              </div>
            </div>
          </div>
        <hr class="divider-w">
        <!-- 필터 , 검색옵션 -->
        <section class="module-small" style="margin-top: -35px; margin-bottom: -35px;">
          <div class="container">
            <form action="./booklist" method="get" class="row">
              <div class="col-sm-4 mb-sm-20">
                <select class="form-control" name="bkcate" onchange="rePage(this)">
                  <option selected="selected" value="0">전체장르</option>
                  <option value="1">소설</option>
                  <option value="2">에세이</option>
                  <option value="3">자기개발</option>
                </select>
              </div>
              <div class="col-sm-2 mb-sm-20">
                <select class="form-control" name="searchN" id="searchN">
                  <option selected="selected" value="all">전체조건</option>
                  <option value="name">책이름</option>
                  <option value="write">저자</option>
                </select>
              </div>
              <div class="col-sm-3 mb-sm-20">
              <input class="form-control" type="text" name="searchV" id="searchV">
              <%-- <input type="hidden" name="bkcate" value="${param.bkcate }" > --%>
              </div>
              <div class="col-sm-3">
                <button class="btn btn-block btn-round btn-g" type="submit">검색</button>
              </div>
            </form>
          </div>
          <div>
           검색 결과 ${booklist[0].count }개의 책이 있음
          </div>
        </section>
        
        <!-- 본문 책리스트 -->
        <hr class="divider-w">
        <section class="module-small">
          <div class="container">
            <div class="row multi-columns-row">
              <c:forEach items="${booklist }" var="row">         
              <div class="col-sm-3 col-md-3 col-lg-3">
                <div class="shop-item">
                  <div class="shop-item-image"><img style="height: 418px;" src="${row.bkimg}" alt="책이미지"/><img class="zheart" src="../img/icon/zzheart.png"/>
                    <div class="shop-item-detail" ><a class="btn btn-round btn-b" href="./bookdetail?bkno=${row.bkno}">
                    상세보기</a><br><br>
                    <a class="btn btn-round btn-b" href="">
                    찜하기</a>
                    </div>
                  </div>
                  <h3 class="shop-item-title font-alt"><a href="./bookdetail?bkno=${row.bkno}">${row.bkname}</a></h3>
                  <a href="./booklist?searchN=write&searchV=${row.bkwrite }"><h6>${row.bkwrite}</h6></a>
                  <fmt:formatNumber value="${row.bkprice}" pattern="#,###"/>원
                </div>
              </div>
              </c:forEach>
            </div>
            <div class="row">
              <div class="col-sm-12">
                <div class="pagination font-alt"><a href="#"><i class="fa fa-angle-left"></i></a><a class="active" href="#">1</a><a href="#">2</a><a href="#">3</a><a href="#">4</a><a href="#"><i class="fa fa-angle-right"></i></a></div>
              </div>
            </div>
          </div>
        </section>
        
        <div id="booklist-container">
         <!-- 책 목록이 여기에 동적으로 추가됩니다. -->
        </div>
        
        <!-- 하단 풋 -->
        <div class="module-small bg-dark">
          <div class="container">
            <div class="row">
              <div class="col-sm-3">
                <div class="widget">
                  <h5 class="widget-title font-alt">About Titan</h5>
                  <p>The languages only differ in their grammar, their pronunciation and their most common words.</p>
                  <p>Phone: +1 234 567 89 10</p>Fax: +1 234 567 89 10
                  <p>Email:<a href="#">somecompany@example.com</a></p>
                </div>
              </div>
              <div class="col-sm-3">
                <div class="widget">
                  <h5 class="widget-title font-alt">Recent Comments</h5>
                  <ul class="icon-list">
                    <li>Maria on <a href="#">Designer Desk Essentials</a></li>
                    <li>John on <a href="#">Realistic Business Card Mockup</a></li>
                    <li>Andy on <a href="#">Eco bag Mockup</a></li>
                    <li>Jack on <a href="#">Bottle Mockup</a></li>
                    <li>Mark on <a href="#">Our trip to the Alps</a></li>
                  </ul>
                </div>
              </div>
              <div class="col-sm-3">
                <div class="widget">
                  <h5 class="widget-title font-alt">Blog Categories</h5>
                  <ul class="icon-list">
                    <li><a href="#">Photography - 7</a></li>
                    <li><a href="#">Web Design - 3</a></li>
                    <li><a href="#">Illustration - 12</a></li>
                    <li><a href="#">Marketing - 1</a></li>
                    <li><a href="#">Wordpress - 16</a></li>
                  </ul>
                </div>
              </div>
              <div class="col-sm-3">
                <div class="widget">
                  <h5 class="widget-title font-alt">Popular Posts</h5>
                  <ul class="widget-posts">
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="assets/images/rp-1.jpg" alt="Post Thumbnail"/></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title"><a href="#">Designer Desk Essentials</a></div>
                        <div class="widget-posts-meta">23 january</div>
                      </div>
                    </li>
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="assets/images/rp-2.jpg" alt="Post Thumbnail"/></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title"><a href="#">Realistic Business Card Mockup</a></div>
                        <div class="widget-posts-meta">15 February</div>
                      </div>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
        <hr class="divider-d">
        <footer class="footer bg-dark">
          <div class="container">
            <div class="row">
              <div class="col-sm-6">
                <p class="copyright font-alt">&copy; 2017&nbsp;<a href="index.html">TitaN</a>, All Rights Reserved</p>
              </div>
              <div class="col-sm-6">
                <div class="footer-social-links"><a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-dribbble"></i></a><a href="#"><i class="fa fa-skype"></i></a>
                </div>
              </div>
            </div>
          </div>
        </footer>
      </div>
      <div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div>
    </main>
    <!--  
    JavaScripts
    =============================================
    -->
    <script src="../assets/lib/jquery/dist/jquery.js"></script>
    <script src="../assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="../assets/lib/wow/dist/wow.js"></script>
    <script src="../assets/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
    <script src="../assets/lib/isotope/dist/isotope.pkgd.js"></script>
    <script src="../assets/lib/imagesloaded/imagesloaded.pkgd.js"></script>
    <script src="../assets/lib/flexslider/jquery.flexslider.js"></script>
    <script src="../assets/lib/owl.carousel/dist/owl.carousel.min.js"></script>
    <script src="../assets/lib/smoothscroll.js"></script>
    <script src="../assets/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
    <script src="../assets/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
    <script src="../assets/js/plugins.js"></script>
    <script src="../assets/js/main.js"></script>
  </body>
</html>