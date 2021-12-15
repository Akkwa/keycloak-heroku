<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=false displayMessage=false; section>
    <#if section="title">
        ${msg("updatePasswordTitle")}
    <#elseif section = "form">

        <div class="login-form">
            <div class="card-center">
                <div class="card form-card">
                    <div class="card-body">
                        <h2 class="title-card mb-5">Atualizar Senha</h2>

                        <#if message?has_content>
                            <div id="login-alert" class="alert alert-danger col-sm-12">
                                <span class="kc-feedback-text">${kcSanitize(message.summary)?no_esc}</span>
                            </div>
                        </#if>

                        <form id="kc-passwd-update-form" class="${properties.kcFormClass!}" 
                            action="${url.loginAction}" method="post">

                            <input type="text" id="username" name="username" value="${username}" autocomplete="username" readonly="readonly" style="display:none;"/>
                            <input type="password" id="password" name="password" autocomplete="current-password" style="display:none;"/>

                            <div class="${properties.kcInputWrapperClass!}">
                                <label for="password-new" class="form-label">${msg("passwordNew")}</label>
                                <input tabindex="2" id="password-new" class="${properties.kcInputClass!}" name="password-new" type="password" autocomplete="new-password"/>
                            </div>

                            <div class="${properties.kcInputWrapperClass!}">
                                <label for="password-confirm" class="form-label">${msg("passwordConfirm")}</label>
                                <input tabindex="2" id="password-confirm" class="${properties.kcInputClass!}" name="password-confirm" type="password" autocomplete="new-password"/>
                            </div>

                            <!-- buttons -->
                            <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                                <input class="${properties.kcButtonClass!}" 
                                    name="login" id="kc-login" type="submit" value="${msg("doSubmit")}"/>
                            </div>
                        </form>
				    </div>
			    </div>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>
