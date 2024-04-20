<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<aside class="left-sidebar sidebar-dark" id="left-sidebar">
	<div id="sidebar" class="sidebar sidebar-with-footer">
		<div class="app-brand">
			<a href="/index.html"> <img
				src="${classpath }/backend/images/logo-1.png" alt="Mono">
			</a>
		</div>
		<div class="sidebar-left" data-simplebar style="height: 100%;">
			<ul class="nav sidebar-inner" id="sidebar-menu">
				<li><a class="sidenav-item-link" href="index.html"> <i
						class="mdi mdi-briefcase-account-outline"></i> <span
						class="nav-text">Business Dashboard</span>
				</a></li>

				<li><a class="sidenav-item-link" href="analytics.html"> <i
						class="mdi mdi-chart-line"></i> <span class="nav-text">Analytics
							Dashboard</span>
				</a></li>

				<li class="section-title">Quản lý</li>

				<li class="has-sub"><a class="sidenav-item-link"
					href="javascript:void(0)" data-toggle="collapse"
					data-target="#category" aria-expanded="false"
					aria-controls="category"> <i
						class="mdi mdi-format-list-bulleted-type"></i> <span
						class="nav-text">Danh mục</span> <b class="caret"></b>
				</a>
					<ul class="collapse" id="category" data-parent="#sidebar-menu">
						<div class="sub-menu">
							<li><a class="sidenav-item-link"
								href="${classpath }/admin/category-list"> <span
									class="nav-text">Danh sách danh mục</span>

							</a></li>
							<li><a class="sidenav-item-link"
								href="${classpath }/admin/category-add"> <span
									class="nav-text">Thêm danh mục</span>

							</a></li>
						</div>
					</ul></li>

				<li class="has-sub"><a class="sidenav-item-link"
					href="javascript:void(0)" data-toggle="collapse"
					data-target="#type" aria-expanded="false" aria-controls="type">
						<i class="mdi mdi-format-list-bulleted-type"></i> <span
						class="nav-text">Loại sản phẩm</span> <b class="caret"></b>
				</a>
					<ul class="collapse" id="type" data-parent="#sidebar-menu">
						<div class="sub-menu">
							<li><a class="sidenav-item-link"
								href="${classpath }/admin/type-product-list"> <span
									class="nav-text">Danh sách loại sản phẩm</span>

							</a></li>
							<li><a class="sidenav-item-link"
								href="${classpath }/admin/type-product-add"> <span
									class="nav-text">Thêm loại sản phẩm</span>

							</a></li>
						</div>
					</ul></li>

				<li class="has-sub"><a class="sidenav-item-link"
					href="javascript:void(0)" data-toggle="collapse"
					data-target="#vendor" aria-expanded="false" aria-controls="vendor">
						<i class="mdi mdi-format-list-bulleted-type"></i> <span
						class="nav-text">Nhà cung cấp</span> <b class="caret"></b>
				</a>
					<ul class="collapse" id="vendor" data-parent="#sidebar-menu">
						<div class="sub-menu">
							<li><a class="sidenav-item-link"
								href="${classpath }/admin/vendor-list"> <span
									class="nav-text">Danh sách nhà cung cấp</span>

							</a></li>
							<li><a class="sidenav-item-link"
								href="${classpath }/admin/vendor-add"> <span
									class="nav-text">Thêm nhà cung cấp</span>

							</a></li>
						</div>
					</ul></li>

				<li class="has-sub"><a class="sidenav-item-link"
					href="javascript:void(0)" data-toggle="collapse"
					data-target="#product" aria-expanded="false"
					aria-controls="product"> <i
						class="mdi mdi-format-list-bulleted-type"></i> <span
						class="nav-text">Sản phẩm</span> <b class="caret"></b>
				</a>
					<ul class="collapse" id="product" data-parent="#sidebar-menu">
						<div class="sub-menu">
							<li><a class="sidenav-item-link" href="email-inbox.html">
									<span class="nav-text">Danh sách sản phẩm</span>

							</a></li>
							<li><a class="sidenav-item-link" href="email-details.html">
									<span class="nav-text">Thêm sản phẩm</span>

							</a></li>
						</div>
					</ul></li>
				<li class="has-sub"><a class="sidenav-item-link"
					href="javascript:void(0)" data-toggle="collapse"
					data-target="#banner" aria-expanded="false" aria-controls="banner">
						<i class="mdi mdi-format-list-bulleted-type"></i> <span
						class="nav-text">Banner</span> <b class="caret"></b>
				</a>
					<ul class="collapse" id="banner" data-parent="#sidebar-menu">
						<div class="sub-menu">
							<li><a class="sidenav-item-link"
								href="${classpath }/admin/banner-list"> <span
									class="nav-text">Danh sách banner</span>

							</a></li>
							<li><a class="sidenav-item-link"
								href="${classpath }/admin/banner-add"> <span
									class="nav-text">Thêm banner</span>

							</a></li>
						</div>
					</ul></li>

				<li class="section-title">Hệ thống</li>
				<li class="has-sub"><a class="sidenav-item-link"
					href="javascript:void(0)" data-toggle="collapse"
					data-target="#role" aria-expanded="false"
					aria-controls="role"> <i
						class="mdi mdi-format-list-bulleted-type"></i> <span
						class="nav-text">Quản lý quyền</span> <b class="caret"></b>
				</a>
					<ul class="collapse" id="role" data-parent="#sidebar-menu">
						<div class="sub-menu">
							<li><a class="sidenav-item-link" href="${classpath }/admin/role-list">
									<span class="nav-text">Danh sách quyền</span>

							</a></li>
							<li><a class="sidenav-item-link" href="${classpath }/admin/role-add">
									<span class="nav-text">Thêm quyền</span>

							</a></li>
						</div>
					</ul></li>
				<li class="has-sub"><a class="sidenav-item-link"
					href="javascript:void(0)" data-toggle="collapse"
					data-target="#user" aria-expanded="false"
					aria-controls="user"> <i
						class="mdi mdi-format-list-bulleted-type"></i> <span
						class="nav-text">Quản lý tài khoản</span> <b class="caret"></b>
				</a>
					<ul class="collapse" id="user" data-parent="#sidebar-menu">
						<div class="sub-menu">
							<li><a class="sidenav-item-link" href="${classpath }/admin/user-list">
									<span class="nav-text">Danh sách tài khoản</span>

							</a></li>
							<li><a class="sidenav-item-link" href="${classpath }/admin/user-add">
									<span class="nav-text">Thêm tài khoản</span>

							</a></li>
						</div>
					</ul></li>

				<li class="section-title">Báo cáo và thống kê</li>
			</ul>
		</div>
</aside>