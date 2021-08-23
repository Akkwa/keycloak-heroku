<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "title">
        ${msg("registerWithTitle",(realm.displayName!''))}
    <#elseif section = "form">

		<div class="login-form-scroll">
			<div class="card-center">
				<div class="card form-card">
					<div class="card-body">
						<h2 class="title-card mb-5">Registro</h2>

						<#if message?has_content>
							<div id="login-alert" class="alert alert-danger col-sm-12">
								<span class="kc-feedback-text">${kcSanitize(message.summary)?no_esc}</span>
							</div>
						</#if>

						<form id="kc-kc-register-form" class="${properties.kcFormClass!}"
							action="${url.registrationAction}"
							method="post">

							<!-- firstName -->
							<div class="${properties.kcInputWrapperClass!}">
								<label for="password" class="form-label">${msg("firstName")}</label>
								<input id="firstName" class="${properties.kcInputClass!}" name="firstName" value="${(register.formData.firstName!'')}"/>
							</div>

							<!-- lastName -->
							<div class="${properties.kcInputWrapperClass!}">
								<label for="lastName" class="form-label">${msg("lastName")}</label>
								<input id="lastName" class="${properties.kcInputClass!}" name="lastName" value="${(register.formData.lastName!'')}"/>
							</div>

							<!-- email -->
							<div class="${properties.kcInputWrapperClass!}">
								<label for="email" class="form-label">${msg("email")}</label>
								<input id="email" class="${properties.kcInputClass!}" name="email" value="${(register.formData.email!'')}" autocomplete="email"/>
							</div>

							<!-- username -->
							<#if !realm.registrationEmailAsUsername>
								<div class="${properties.kcInputWrapperClass!}">
									<label for="username" class="form-label">${msg("username")}</label>
									<input id="username" class="${properties.kcInputClass!}" name="username" value="${(register.formData.username!'')}" autocomplete="username"/>
								</div>
							</#if>

							<!-- password -->
							<#if passwordRequired>
								<div class="${properties.kcInputWrapperClass!}">
									<label for="password" class="form-label">${msg("password")}</label>
									<input id="password" type="password" class="${properties.kcInputClass!}" name="password" value="${(register.formData.password!'')}" autocomplete="new-password"/>
								</div>

								<!-- repassword -->
								<div class="${properties.kcInputWrapperClass!}">
									<label for="password-confirm" class="form-label">${msg("passwordConfirm")}</label>
									<input id="password-confirm" type="password" class="${properties.kcInputClass!}" name="password-confirm"/>
								</div>
							</#if>


							<!-- recaptcha -->
							<#if recaptchaRequired??>
								<div class="form-group" style="margin: 0px;">
									<div class="${properties.kcInputWrapperClass!}">
										<div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
									</div>
								</div>
							</#if>

							<!-- buttons -->
							<div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
								<input class="${properties.kcButtonClass!}" type="submit" value="${msg("doRegister")}"/>
								<a class="${properties.kcSecondaryButtonClass!}" href="${url.loginUrl}">${msg("backToLogin")?no_esc}</a></span>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="login-img">
			<div class="center-image">
				<div class="akkwa-logo"></div>
			</div>
		</div>
    </#if>
</@layout.registrationLayout>
