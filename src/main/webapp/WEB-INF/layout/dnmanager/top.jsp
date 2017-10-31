<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div class="navbar-container ace-save-state" id="navbar-container">
		<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
			<span class="sr-only">Toggle sidebar</span>

			<span class="icon-bar"></span>

			<span class="icon-bar"></span>

			<span class="icon-bar"></span>
		</button>
		<div class="navbar-header pull-left">
			<a href="/dnmanager/" class="navbar-brand">
				<small>
					<i class="fa fa-leaf"></i>
					Ninano
				</small>
			</a>
		</div>
		
		<div class="navbar-buttons navbar-header pull-right" role="navigation">
			<ul class="nav ace-nav">
				<li class="light-blue dropdown-modal">
					<a data-toggle="dropdown" href="#" class="dropdown-toggle">
						<img class="nav-user-photo" src="/content/img/com/ico-people.png" alt="Jason's Photo" />
						<span class="user-info">
							<small>Welcome,</small>
							${user.username}
						</span>

						<i class="ace-icon fa fa-caret-down"></i>
					</a>

					<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
						<li>
							<a href="/main" target="_blank">
								<i class="ace-icon fa fa-external-link"></i>
								ninano Site
							</a>
						</li>
						<li class="divider"></li>

						<li>
							<a href="/dnmanager/user/auth-logout">
								<i class="ace-icon fa fa-power-off"></i>
								Logout
							</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</div><!-- /.navbar-container -->
