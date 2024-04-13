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
								href="${classpath }/admin/category-list"> <span class="nav-text">Xem
										danh mục</span>

							</a></li>
							<li><a class="sidenav-item-link"
								href="${classpath }/admin/category-add"> <span class="nav-text">Thêm
										danh mục</span>

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
							<li><a class="sidenav-item-link" href="${classpath }/admin/type-product-list"> <span
									class="nav-text">Xem loại sản phẩm</span>

							</a></li>
							<li><a class="sidenav-item-link" href="${classpath }/admin/type-product-add">
									<span class="nav-text">Thêm loại sản phẩm</span>

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
							<li><a class="sidenav-item-link" href="email-inbox.html">
									<span class="nav-text">Xem nhà cung cấp</span>

							</a></li>
							<li><a class="sidenav-item-link" href="email-details.html">
									<span class="nav-text">Thêm nhà cung cấp</span>

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
									<span class="nav-text">Xem sản phẩm</span>

							</a></li>
							<li><a class="sidenav-item-link" href="email-details.html">
									<span class="nav-text">Thêm sản phẩm</span>

							</a></li>
						</div>
					</ul></li>
		</div>
</aside>