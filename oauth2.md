简化版oauth2接入流程

本平台的oauth2接入方式，相对于标准的oauth2接入，并不需要用户点击按钮进行授权确认，本步骤是自动完成的，有点类似于微信的静默授权

步骤如下：

### 1. 获取code
根据后台设置的参数引导用户进入此页面
```
http://edu.updust.com/oauth/authorize?redirect_uri=http%3A%2F%2Fapp0.geekernel.com%2Fcallback&response_type=code&client_id=testApp
```

参数|类型|说明
---|---|---|---
redirect_uri|String|授权后重定向的回调链接地址，，与后台设置要一致，需要urlencode
client_id|String|应用的唯一标识
response_type|String|固定值为code

用户进入此页面  
如果未在平台登录，将被自动导向登录页，登录完成后返回此页  
如果已经登录，此页面自动取得token参数，然后向同url发送post请求（此步骤相当于用户确认），请求参数如下

参数|类型|说明
---|---|---|---
redirect_uri|String|授权后重定向的回调链接地址
client_id|String|应用的唯一标识
response_type|String|固定值为code
token|String|用户令牌

注意此POST步骤为页面自动完成，第三方只需将用户导到这个页面即可！
请求成功后浏览器将跳转到redirect_uri的地址，并附上code参数
```
http://app0.geekernel.com/callback?code=bb352ea7f41e1c9fd31ddf55f4d9813874085c82
```

### 2. 通过code获取access_token

POST
```
http://edu.updust.com/oauth/token
```

参数|类型|说明
---|---|---|---
grant_type|String|固定为authorization_code
code|String|上一步返回的code
client_id|String|应用的唯一标识
client_secret|String|应用的密钥
redirect_uri|String|与上一步要保持一致

返回  
```
{
  "token_type": "bearer",
  "access_token": "71ee01bff73ae0f425865b476ccb11f4652a7e1e",
  "expires_in": 3600,
  "refresh_token": "949a46ebbe87122c255c234c1d6e9e7ce7b72735"
}
```

参数|类型|说明
---|---|---|---
token_type|String|固定为bearer
access_token|String|用于调用api时作为用户身份验证
expires_in|String|access_token过期时间，秒
refresh_token|String|用于超时后获取新的access_token


### 3. 通过access_token调用api

[http://edu.updust.com/api.html](http://edu.updust.com/api.html)