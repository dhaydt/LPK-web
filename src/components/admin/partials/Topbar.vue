<template>
	<header id="page-topbar">
		<div class="navbar-header">
			<div class="d-flex">
				<!-- LOGO -->
				<div class="navbar-brand-box">
					<a href="index.html" class="logo logo-dark">
						<span class="logo-sm">
							<img src="@/assets/images/logo-sm-dark.png" alt height="22" />
						</span>
						<span class="logo-lg">
							<img src="@/assets/images/logo-dark.png" alt height="20" />
						</span>
					</a>

					<a href="index.html" class="logo logo-light">
						<span class="logo-sm">
							<img src="@/assets/images/logo-sm-light.png" alt height="22" />
						</span>
						<span class="logo-lg">
							<img src="@/assets/images/logo-light.png" alt height="20" />
						</span>
					</a>
				</div>

				<!-- <button
					@click="toggleMenu"
					type="button"
					class="btn btn-sm px-3 font-size-24 header-item waves-effect"
					id="vertical-menu-btn"
				>
					<i class="ri-menu-2-line align-middle"></i>
				</button> -->

			</div>

			<div class="d-flex">
				<!-- <div class="dropdown d-inline-block d-lg-none ml-2">
					<button
						type="button"
						class="btn header-item noti-icon waves-effect"
						id="page-header-search-dropdown"
						data-toggle="dropdown"
						aria-haspopup="true"
						aria-expanded="false"
					>
						<i class="ri-search-line"></i>
					</button>
					<div
						class="dropdown-menu dropdown-menu-lg dropdown-menu-right p-0"
						aria-labelledby="page-header-search-dropdown"
					>
						<form class="p-3">
							<div class="form-group m-0">
								<div class="input-group">
									<input
										type="text"
										class="form-control"
										placeholder="Search ..."
									/>
									<div class="input-group-append">
										<button class="btn btn-primary" type="submit">
											<i class="ri-search-line"></i>
										</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>

				<b-dropdown
					class="d-none d-lg-inline-block d-lg-inline-block ml-1"
					menu-class="dropdown-menu-lg"
					right
					toggle-class="header-item noti-icon"
					variant="black"
				>
					<template v-slot:button-content>
						<i class="ri-apps-2-line"></i>
					</template>
					<div class="px-lg-2">
						<div class="row no-gutters">
							<div class="col">
								<a class="dropdown-icon-item" href="javascript: void(0);">
									<img src="@/assets/images/brands/github.png" alt="Github" />
									<span>{{ ("navbar.dropdown.site.list.github") }}</span>
								</a>
							</div>
							<div class="col">
								<a class="dropdown-icon-item" href="javascript: void(0);">
									<img
										src="@/assets/images/brands/bitbucket.png"
										alt="bitbucket"
									/>
									<span>{{ ("navbar.dropdown.site.list.github") }}</span>
								</a>
							</div>
							<div class="col">
								<a class="dropdown-icon-item" href="javascript: void(0);">
									<img
										src="@/assets/images/brands/dribbble.png"
										alt="dribbble"
									/>
									<span>{{ ("navbar.dropdown.site.list.dribbble") }}</span>
								</a>
							</div>
						</div>

						<div class="row no-gutters">
							<div class="col">
								<a class="dropdown-icon-item" href="javascript: void(0);">
									<img src="@/assets/images/brands/dropbox.png" alt="dropbox" />
									<span>{{ ("navbar.dropdown.site.list.dropbox") }}</span>
								</a>
							</div>
							<div class="col">
								<a class="dropdown-icon-item" href="javascript: void(0);">
									<img
										src="@/assets/images/brands/mail_chimp.png"
										alt="mail_chimp"
									/>
									<span>{{ ("navbar.dropdown.site.list.mailchimp") }}</span>
								</a>
							</div>
							<div class="col">
								<a class="dropdown-icon-item" href="javascript: void(0);">
									<img src="@/assets/images/brands/slack.png" alt="slack" />
									<span>{{ ("navbar.dropdown.site.list.slack") }}</span>
								</a>
							</div>
						</div>
					</div>
				</b-dropdown> -->

				<div class="dropdown d-none d-lg-inline-block ml-1">
					<button
						type="button"
						class="btn header-item noti-icon waves-effect"
						@click="initFullScreen"
					>
						<i class="ri-fullscreen-line"></i>
					</button>
				</div>
<!-- 
				<b-dropdown
					right
					menu-class="dropdown-menu-lg p-0"
					toggle-class="header-item noti-icon"
					variant="black"
				>
					<template v-slot:button-content>
						<i class="ri-notification-3-line"></i>
						<span class="noti-dot"></span>
					</template>
					<div class="p-3">
						<div class="row align-items-center">
							<div class="col">
								<h6 class="m-0">
									{{ ("navbar.dropdown.notification.text") }}
								</h6>
							</div>
							<div class="col-auto">
								<a href="#!" class="small">{{
									("navbar.dropdown.notification.subtext")
								}}</a>
							</div>
						</div>
					</div>
					<simplebar style="max-height: 230px;">
						<a href class="text-reset notification-item">
							<div class="media">
								<div class="avatar-xs mr-3">
									<span
										class="avatar-title bg-primary rounded-circle font-size-16"
									>
										<i class="ri-shopping-cart-line"></i>
									</span>
								</div>
								<div class="media-body">
									<h6 class="mt-0 mb-1">
										{{ ("navbar.dropdown.notification.order.title") }}
									</h6>
									<div class="font-size-12 text-muted">
										<p class="mb-1">
											{{ ("navbar.dropdown.notification.order.text") }}
										</p>
										<p class="mb-0">
											<i class="mdi mdi-clock-outline"></i>
											{{ ("navbar.dropdown.notification.order.time") }}
										</p>
									</div>
								</div>
							</div>
						</a>
						<a href class="text-reset notification-item">
							<div class="media">
								<img
									src="@/assets/images/users/avatar-3.jpg"
									class="mr-3 rounded-circle avatar-xs"
									alt="user-pic"
								/>
								<div class="media-body">
									<h6 class="mt-0 mb-1">
										{{ ("navbar.dropdown.notification.james.title") }}
									</h6>
									<div class="font-size-12 text-muted">
										<p class="mb-1">
											{{ ("navbar.dropdown.notification.james.text") }}
										</p>
										<p class="mb-0">
											<i class="mdi mdi-clock-outline"></i>
											{{ ("navbar.dropdown.notification.james.time") }}
										</p>
									</div>
								</div>
							</div>
						</a>
						<a href class="text-reset notification-item">
							<div class="media">
								<div class="avatar-xs mr-3">
									<span
										class="avatar-title bg-success rounded-circle font-size-16"
									>
										<i class="ri-checkbox-circle-line"></i>
									</span>
								</div>
								<div class="media-body">
									<h6 class="mt-0 mb-1">
										{{ ("navbar.dropdown.notification.item.title") }}
									</h6>
									<div class="font-size-12 text-muted">
										<p class="mb-1">
											{{ ("navbar.dropdown.notification.item.text") }}
										</p>
										<p class="mb-0">
											<i class="mdi mdi-clock-outline"></i>
											{{ ("navbar.dropdown.notification.item.time") }}
										</p>
									</div>
								</div>
							</div>
						</a>
						<a href class="text-reset notification-item">
							<div class="media">
								<img
									src="@/assets/images/users/avatar-4.jpg"
									class="mr-3 rounded-circle avatar-xs"
									alt="user-pic"
								/>
								<div class="media-body">
									<h6 class="mt-0 mb-1">
										{{ ("navbar.dropdown.notification.salena.title") }}
									</h6>
									<div class="font-size-12 text-muted">
										<p class="mb-1">
											{{ ("navbar.dropdown.notification.salena.text") }}
										</p>
										<p class="mb-0">
											<i class="mdi mdi-clock-outline"></i>
											{{ ("navbar.dropdown.notification.salena.time") }}
										</p>
									</div>
								</div>
							</div>
						</a>
					</simplebar>
					<div class="p-2 border-top">
						<a
							class="btn btn-sm btn-link font-size-14 btn-block text-center"
							href="javascript:void(0)"
						>
							<i class="mdi mdi-arrow-right-circle mr-1"></i>
							{{ ("navbar.dropdown.notification.button") }}
						</a>
					</div>
				</b-dropdown> -->

				<b-dropdown
					right
					variant="black"
					toggle-class="header-item"
					class="d-inline-block user-dropdown"
				>
					<template v-slot:button-content>
						<img
							class="rounded-circle header-profile-user"
							src="@/assets/images/users/avatar-2.jpg"
							alt="Header Avatar"
						/>
						<span class="d-none d-xl-inline-block ml-1">{{
							user.username
						}}</span>
						<i class="mdi mdi-chevron-down d-none d-xl-inline-block"></i>
					</template>
					<!-- item-->
					<a class="dropdown-item" href="#">
						<i class="ri-user-line align-middle mr-1"></i>
						Profile
					</a>
					<a class="dropdown-item d-block" href="#">
						<span class="badge badge-success float-right mt-1">11</span>
						<i class="ri-settings-2-line align-middle mr-1"></i>
						Setting
					</a>
					<div class="dropdown-divider"></div>
					<router-link class="dropdown-item text-danger" to="/">
						<i class="ri-shut-down-line align-middle mr-1 text-danger"></i>
						Logout
					</router-link>
				</b-dropdown>
			</div>
		</div>
	</header>
</template>

<script>
import simplebar from "simplebar-vue";
export default {
	data() {
		return {
			user: {}
		};
	},
	components: { simplebar },
	created(){
		const auth = JSON.parse(localStorage.getItem('auth'))
		// console.log(user.user)
		this.user = auth.user 
	},
	methods: {
		toggleMenu() {
			this.$parent.toggleMenu();
		},
		initFullScreen() {
			document.body.classList.toggle("fullscreen-enable");
			if (
				!document.fullscreenElement &&
				/* alternative standard method */ !document.mozFullScreenElement &&
				!document.webkitFullscreenElement
			) {
				// current working methods
				if (document.documentElement.requestFullscreen) {
					document.documentElement.requestFullscreen();
				} else if (document.documentElement.mozRequestFullScreen) {
					document.documentElement.mozRequestFullScreen();
				} else if (document.documentElement.webkitRequestFullscreen) {
					document.documentElement.webkitRequestFullscreen(
						Element.ALLOW_KEYBOARD_INPUT
					);
				}
			} else {
				if (document.cancelFullScreen) {
					document.cancelFullScreen();
				} else if (document.mozCancelFullScreen) {
					document.mozCancelFullScreen();
				} else if (document.webkitCancelFullScreen) {
					document.webkitCancelFullScreen();
				}
			}
		},
		toggleRightSidebar() {
			this.$parent.toggleRightSidebar();
		},
		setLanguage(locale) {
			i18n.locale = locale;
			this.current_language = i18n.locale;
		},
	},
};
</script>

<style lang="scss" scoped></style>
