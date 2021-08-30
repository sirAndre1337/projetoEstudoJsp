<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html lang="en">

<head>
   <jsp:include page="head.jsp"></jsp:include>
</head>

<body>
<!-- Pre-loader start -->

<jsp:include page="pre-load.jsp"></jsp:include>

<!-- Pre-loader end -->
<div id="pcoded" class="pcoded">
    <div class="pcoded-overlay-box"></div>
    <div class="pcoded-container navbar-wrapper">

		<jsp:include page="barradenavegacaocima.jsp"></jsp:include>
    
        <div class="pcoded-main-container">
            <div class="pcoded-wrapper">
                
                <jsp:include page="barradenavegacaolado.jsp"></jsp:include>
                
                <div class="pcoded-content">
                    <!-- Page-header start -->
                    
                    <jsp:include page="page-header.jsp"></jsp:include>
                    
                    <!-- Page-header end -->
                    <div class="pcoded-inner-content">
                        <div class="main-body">
                            <div class="page-wrapper">
                                <!-- Page body start -->
                                <div class="page-body button-page">
                                    <div class="row">
                                        <!-- bootstrap modal start -->
                                        <div class="col-sm-12">
                                            <!-- Notification card start -->
                                            <div class="card">
                                                <div class="card-header">
                                                    <h5>Notifications</h5>
                                                </div>
                                                <div class="card-block">
                                                    <div class="row">
                                                        <div class="col-sm-12">
                                                            <div class="sub-title">Notification Position</div>
                                                            <p>This plugin has layout options where you can display it in any corner of the screen, simply click one layout corners and press the buttons on the other section to see the magic</p>
                                                            <div class="location-selector">
                                                                <div class="bit top left" data-position="top left"></div>
                                                                <div class="bit top right" data-position="top right"></div>
                                                                <div class="bit top" data-position="top"></div>
                                                                <div class="bit bottom left" data-position="bottom left"></div>
                                                                <div class="bit bottom right" data-position="bottom right"></div>
                                                                <div class="bit bottom" data-position="bottom"></div>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-12">
                                                            <div class="sub-title">Notification Alert</div>
                                                            <p>Notification color : <code> data-type="inverse"</code> Notification position : <code> data-align="left" </code></p>
                                                            <ul class="notifications">
                                                                <li>
                                                                    <button class="btn btn-primary waves-effect" data-type="inverse" data-from="top" data-align="left" data-icon="fa fa-check">Top Left</button>
                                                                </li>
                                                                <li>
                                                                    <button class="btn btn-primary waves-effect" data-type="inverse" data-from="top" data-align="right" data-icon="fa fa-comments">Top Right</button>
                                                                </li>
                                                                <li>
                                                                    <button class="btn btn-primary waves-effect" data-type="inverse" data-from="top" data-align="center" data-icon="fa fa-comments">Top Center</button>
                                                                </li>
                                                                <li>
                                                                    <button class="btn btn-primary waves-effect" data-type="inverse" data-from="bottom" data-align="left">Bottom Left</button>
                                                                </li>
                                                                <li>
                                                                    <button class="btn btn-primary waves-effect" data-type="inverse" data-from="bottom" data-align="right">Bottom Right</button>
                                                                </li>
                                                                <li>
                                                                    <button class="btn btn-primary waves-effect" data-type="inverse" data-from="bottom" data-align="center">Bottom Center</button>
                                                                </li>
                                                            </ul>
                                                            <div class="sub-title">Notification Position</div>
                                                            <p>Change data-type : <code> data-type="primary"</code> to change notification color</p>
                                                            <ul class="notifications">
                                                                <li>
                                                                    <button class="btn btn-inverse waves-effect" data-type="inverse" data-from="top" data-align="right" data-icon="fa fa-check">Inverse</button>
                                                                </li>
                                                                <li>
                                                                    <button class="btn btn-primary waves-effect" data-type="primary" data-from="top" data-align="right" data-icon="fa fa-comments">Primary</button>
                                                                </li>
                                                                <li>
                                                                    <button class="btn btn-info waves-effect" data-type="info" data-from="top" data-align="right" data-icon="fa fa-comments">Info</button>
                                                                </li>
                                                                <li>
                                                                    <button class="btn btn-success waves-effect" data-type="success" data-from="top" data-align="right">success</button>
                                                                </li>
                                                                <li>
                                                                    <button class="btn btn-warning waves-effect" data-type="warning" data-from="top" data-align="right">Warning</button>
                                                                </li>
                                                                <li>
                                                                    <button class="btn btn-danger waves-effect" data-type="danger" data-from="top" data-align="right">Danger</button>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <div class="col-sm-12">
                                                            <div class="sub-title">Notification Behaviour</div>
                                                            <p>use code <code>data-animation-in="animated fadeIn"  data-animation-out="animated fadeOut"</code> notification animation effect</p>
                                                            <ul class="notifications">
                                                                <li>
                                                                    <button class="btn btn-primary waves-effect" data-type="inverse" data-animation-in="animated fadeIn" data-animation-out="animated fadeOut">Fade In</button>
                                                                </li>
                                                                <li>
                                                                    <button class="btn btn-primary waves-effect" data-type="inverse" data-animation-in="animated fadeInLeft" data-animation-out="animated fadeOutLeft">Fade In Left</button>
                                                                </li>
                                                                <li>
                                                                    <button class="btn btn-primary waves-effect" data-type="inverse" data-animation-in="animated fadeInRight" data-animation-out="animated fadeOutRight">Fade In Right</button>
                                                                </li>
                                                                <li>
                                                                    <button class="btn btn-primary waves-effect" data-type="inverse" data-animation-in="animated fadeInUp" data-animation-out="animated fadeOutUp">Fade In Up</button>
                                                                </li>
                                                                <li>
                                                                    <button class="btn btn-primary waves-effect" data-type="inverse" data-animation-in="animated fadeInDown" data-animation-out="animated fadeOutDown">Fade In Down</button>
                                                                </li>
                                                                <li>
                                                                    <button class="btn btn-primary waves-effect" data-type="inverse" data-animation-in="animated bounceIn" data-animation-out="animated bounceOut">Bounce In</button>
                                                                </li>
                                                                <li>
                                                                    <button class="btn btn-primary waves-effect" data-type="inverse" data-animation-in="animated bounceInLeft" data-animation-out="animated bounceOutLeft">Bounce In Left</button>
                                                                </li>
                                                                <li>
                                                                    <button class="btn btn-primary waves-effect" data-type="inverse" data-animation-in="animated bounceInRight" data-animation-out="animated bounceOutRight">Bounce In Right</button>
                                                                </li>
                                                                <li>
                                                                    <button class="btn btn-primary waves-effect" data-type="inverse" data-animation-in="animated rotateInDownRight" data-animation-out="animated rotateOutUpRight">Fall In Right</button>
                                                                </li>
                                                                <li>
                                                                    <button class="btn btn-primary waves-effect" data-type="inverse" data-animation-in="animated rotateIn" data-animation-out="animated rotateOut">Rotate In</button>
                                                                </li>
                                                                <li>
                                                                    <button class="btn btn-primary waves-effect" data-type="inverse" data-animation-in="animated flipInX" data-animation-out="animated flipOutX">Flip In X</button>
                                                                </li>
                                                                <li>
                                                                    <button class="btn btn-primary waves-effect" data-type="inverse" data-animation-in="animated flipInY" data-animation-out="animated flipOutY">Flip In Y</button>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Notification card end -->
                                        </div>
                                        <!-- Bootstrap modal end -->
                                    </div>
                                </div>
                                <!-- Page body end -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Main-body end -->
                
                <div id="styleSelector">
                
                </div>
            </div>
        </div>
    </div>
</div>


<jsp:include page="javascriptdohtml.jsp"></jsp:include>


	</body>

</html>
    