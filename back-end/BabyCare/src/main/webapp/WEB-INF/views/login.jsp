<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
	<!-- Variables -->
	<jsp:include page="/WEB-INF/views/common/variable.jsp"></jsp:include>
	<!-- CSS -->
	<jsp:include page="/WEB-INF/views/backend/layout/css.jsp"></jsp:include>
  <title>Đăng nhập</title>

</head>

</head>
  <body class="bg-light-gray" id="body">
          <div class="container d-flex align-items-center justify-content-center" style="min-height: 100vh">
          <div class="d-flex flex-column justify-content-between">
            <div class="row justify-content-center">
              <div class="col-lg-6 col-md-10">
                <div class="card card-default mb-0">
                	 <div class="card-header pb-0">
                    <div class="app-brand w-100 d-flex justify-content-center border-bottom-0">
                      <a class="w-auto pl-0" href="/index.html">
                        <img src="${classpath }/backend/images/logo-1.png" alt="Mono">
                       
                      </a>
                    </div>
                  </div>
           
                  <div class="card-body px-5 pb-5 pt-0">

                    <h4 class="text-dark mb-6 text-center">Đăng nhập</h4>

                    <form method="POST" action="${classpath }/login_processing_url">
                      <div class="row">
                        <div class="form-group col-md-12 mb-4">
                          <input class="form-control input-lg" type="text" id="username" name="username"
                            placeholder="email">
                        </div>
                        <div class="form-group col-md-12 ">
                          <input type="password" class="form-control input-lg" id="password" name="password" placeholder="Password">
                        </div>
                        <div class="col-md-12">

                          <div class="d-flex justify-content-between mb-3">

                            <div class="custom-control custom-checkbox mr-3 mb-3">
                              <input type="checkbox" class="custom-control-input" id="remember-me" name="remember-me">
                              <label class="custom-control-label" for="remember-me">Remember me</label>
                            </div>

                            <a class="text-color" href="#"> Quên mật khẩu? </a>

                          </div>

                          <button type="submit" class="btn btn-primary btn-pill mb-4">Đăng nhập</button>

                          
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

</body>
</html>
    