<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header class="main-header" id="header">
				<nav class="navbar navbar-expand-lg navbar-light" id="navbar">
					<!-- Sidebar toggle button -->
					<button id="sidebar-toggler" class="sidebar-toggle">
						<span class="sr-only">Toggle navigation</span>
					</button>

					<div class="navbar-right ">

						<ul class="nav navbar-nav">
							<!-- User Account -->
							<li class="dropdown user-menu">
								<button class="dropdown-toggle nav-link" data-toggle="dropdown">

									<span class="d-none d-lg-inline-block">Cẩm Ly</span>
								</button>
								<ul class="dropdown-menu dropdown-menu-right">
									<li><a class="dropdown-link-item" href="user-profile.html">
											<i class="mdi mdi-account-outline"></i> <span
											class="nav-text">My Profile</span>
									</a></li>
									<li><a class="dropdown-link-item"
										href="user-activities.html"> <i
											class="mdi mdi-diamond-stone"></i> <span class="nav-text">Activitise</span></a>
									</li>
									<li><a class="dropdown-link-item"
										href="user-account-settings.html"> <i
											class="mdi mdi-settings"></i> <span class="nav-text">Account
												Setting</span>
									</a></li>

									<li class="dropdown-footer"><a class="dropdown-link-item"
										href="${classpath }/logout"> <i class="mdi mdi-logout"></i> Log
											Out
									</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</nav>

			</header>