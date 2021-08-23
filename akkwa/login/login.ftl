<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=false displayMessage=false; section>
    <#if section="title">
        ${msg("loginTitle",(realm.displayName!''))}
    <#elseif section="form">
        <#if realm.password>

            <div class="login-form">
                <div class="card-center">
                    <div class="card form-card">
                        <div class="card-body">
                            <h2 class="title-card mb-5">Bem Vindo ao Akkwa</h2>

                            <#if message?has_content>
                                <div id="login-alert" class="alert alert-danger col-sm-12">
                                    <span class="kc-feedback-text">${kcSanitize(message.summary)?no_esc}</span>
                                </div>
                            </#if>

                            <form id="kc-form-login" class="${properties.kcFormClass!}"
                                onsubmit="login.disabled = true; return true;"
                                action="${url.loginAction?keep_after('^[^#]*?://.*?[^/]*', 'r')}"
                                method="post">

                                <!-- username -->
                                <div class="${properties.kcInputWrapperClass!}">
                                    <label for="username" class="form-label">
                                        <#if !realm.loginWithEmailAllowed>${msg("username")}
                                        <#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}
                                        <#else>${msg("email")}
                                        </#if>
                                    </label>
                                    <#if usernameEditDisabled??>
                                        <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" 
                                            value="${(login.username!'')}" type="text" disabled />
                                    <#else>
                                        <input tabindex="1" id="username" class="${properties.kcInputClass!}"
                                                name="username" value="${(login.username!'')}" type="text" autofocus autocomplete="off" /> 
                                    </#if>
                                </div>
                                <!-- password -->
                                <div class="${properties.kcInputWrapperClass!}">
                                    <label for="password" class="form-label">${msg("password")}</label>
                                    <input tabindex="2" id="password" class="${properties.kcInputClass!}" name="password" type="password" autocomplete="off"/>
                                </div>
                    
                                <!-- remember me -->
                                <#if realm.rememberMe && !usernameEditDisabled??>
                                    <div class="col-md-6">
                                        <div class="form-check">
                                            <#if login.rememberMe??>
                                                <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" class="form-check-input" checked>
                                            <#else>
                                                <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" class="form-check-input">
                                            </#if>
                                            <label class="form-check-label" for="gridCheck">
                                                ${msg("rememberMe")}
                                            </label>
                                        </div>
                                    </div>    
                                </#if>

                                <!-- reset password -->
                                <div class="col-md-6 text-end">
                                    <#if realm.resetPasswordAllowed>
                                        <span><a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                                    </#if>
                                </div>

                                <!-- buttons -->
                                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                                    <input tabindex="4" class="${properties.kcButtonClass!}" 
                                        name="login" id="kc-login" type="submit" value="${msg('doLogIn')}"/>
                                    <#if realm.password && social.providers??>
                                        <#list social.providers as p>
                                            <a href="${p.loginUrl}" id="zocial-${p.alias}" class="btn btn-primary w-100">${msg("doLogIn")} With ${p.displayName}</a>
                                        </#list>
                                    </#if>
                                </div>
    
                                <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
                                    <div class="form-group">
                                        <div class="col-md-12 control">
                                            <div style="border-top: 1px solid#888; padding-top:15px;" >
                                                    ${msg("noAccount")} 
                                                <a tabindex="6" href="${url.registrationUrl}" style="font-weight: bold;">
                                                    ${msg("doRegister")}</a>
                                            </div>
                                        </div>
                                    </div>   
                                </#if>
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
    </#if>
</@layout.registrationLayout>