<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=false displayMessage=false; section>
    <#if section="title">
        ${msg("emailForgotTitle")}
    <#elseif section="form">
        <#if realm.password>

            <div class="login-form">
                <div class="card-center">
                    <div class="card form-card">
                        <div class="card-body">
                            <h2 class="title-card mb-5">Resetar Senha</h2>

                            <#if message?has_content>
                                <div id="login-alert" class="alert alert-danger col-sm-12">
                                    <span class="kc-feedback-text">${kcSanitize(message.summary)?no_esc}</span>
                                </div>
                            </#if>

                            <div id="login-warn" class="alert alert-warning col-sm-12">
                                <span class="kc-feedback-text">${msg("emailInstruction")}</span>
                            </div>

                            <form id="kc-reset-password-form" class="${properties.kcFormClass!}"
                                onsubmit="login.disabled = true; return true;"
                                action="${url.loginAction}"
                                method="post">

                                <!-- username -->
                                <div class="${properties.kcInputWrapperClass!}">
                                    <label for="username" class="form-label">
                                        <#if !realm.loginWithEmailAllowed>${msg("username")}
                                        <#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}
                                        <#else>${msg("email")}
                                        </#if>
                                    </label>
                                    <input tabindex="1" id="username" class="${properties.kcInputClass!}"
                                            name="username" value="${(login.username!'')}" type="text" autofocus autocomplete="off" /> 
                                </div>
                    
                                <!-- buttons -->
                                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                                    <input tabindex="4" class="${properties.kcButtonClass!}" 
                                        name="login" id="kc-login" type="submit" value="${msg("doSubmit")}"/>
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
        </div>
    </#if>
</#if>
</@layout.registrationLayout>