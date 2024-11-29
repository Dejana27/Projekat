<%--
  Created by IntelliJ IDEA.
  User: ivanbulajic
  Date: 10.5.24.
  Time: 09:21
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <script src="https://cdn.jsdelivr.net/npm/@splidejs/splide@4.1.4/dist/js/splide.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/@splidejs/splide@4.1.4/dist/css/splide.min.css" rel="stylesheet">
</head>

<body>

<section id="image-carousel" class="splide" aria-label="Beautiful Images">
    <div class="splide__track">
        <ul class="splide__list">
            <li class="splide__slide">
                <asset:image src="hair.jpg"/>
            </li>
            <li class="splide__slide">
                <asset:image src="hair.jpg"/>
            </li>
            <li class="splide__slide">
                <asset:image src="hair.jpg"/>
            </li>
        </ul>
    </div>
</section>
    <asset:javascript src="home.js"/>
</body>

</html>