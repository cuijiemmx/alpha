# 平台Restful接口说明
## 获取用户数据
### URL
```
http://edu.updust.com/api/users/me?access_token=<access_token>  
```

### 参数
参数|类型|可选|说明
---|---|---|---
access_token|String|否|OAuth登录后获得的access_token

### 返回值
一个典型的返回值

```
{
  "_id": "Qfzv7BZ72gyBefr66",
  "createdAt": "2017-04-18T04:30:12.498Z",
  "emails": [
    {
      "address": "cuijiemmx@163.com"
    }
  ],
  "profile": {
    "birthday": "1984-04-19T00:00:00.000Z",
    "gender": "male",
    "mobile": "13482799302",
    "mruApps": [
      "NTT8CSkNpFeYYDTWf",
      "qLx2GKKX3jKBnjwnL"
    ],
    "name": "崔杰",
    "picture": "TXpnDmAcHNQ3GsBuQ",
    "wallpaper": "c6Ngmh2nggkh2RCQX"
  },
  "roles": [
    "admin"
  ],
  "services": {
    "password": {
      "bcrypt": "$2a$10$63hJmVMrjyDOVj75J9kf.estDlNil1vWQOkIU23wauqZO.v8qyGg6"
    },
    "resume": {
      "loginTokens": [
        {
          "hashedToken": "oCzP/aCaV3z9gO8cORzIB50Lk5AvsxXqroXIHKM541g=",
          "when": "2017-04-18T06:18:53.956Z"
        },
        {
          "hashedToken": "4/4/qUbb+gzzeri9lqUP7mVa4hxWEC1+nWfpMG2ueM4=",
          "when": "2017-04-18T17:28:36.987Z"
        }
      ]
    }
  },
  "type": "teacher",
  "username": "tid_cuijiemmx"
}

```

返回数据字段说明

字段|类型|可选|说明
---|---|---|---
_id|String|否|用户id
username|String|否|用户名
emails|[Email](#email)数组|是|Email数组
type|String|否|代表用户类型，可以是teacher, student, parent, app中的一个
services|Object|否|请忽略
roles|String数组|是|请忽略
profile|[Profile](#profile)|是|用户信息
createdAt|String|否|请忽略

<span id="email">Email类型说明</span>

字段|类型|可选|说明
---|---|---|---
address|String|否|email地址
verified|Boolean|是|请忽略

<span id="profile">Profile类型说明</span>

字段|类型|可选|说明
---|---|---|---
picture|String|是|用户头像id
name|String|是|姓名
gender|String|是|性别，可以是male和female中的一个
birthday|dkjfdkj|是|生日
mobile|String|是|手机号
wallpaper|String|是|请忽略
mruApps|String数组|是|请忽略


## 获取用户头像
此请求不需要用户认证，可直接调用
### URL
```
http://edu.updust.com/api/users/<user_id>/head_image_url
```
### 参数
参数|类型|可选|说明
---|---|---|---
user_id |String|否|user id
### 返回值
user不存在时返回404   
存在时，返回200, 内容为图片的实际链接，如
```
http://edu.updust.com/cfs/files/HeadImages/TXpnDmAcHNQ3GsBuQ/523b06fbbd25b3fdcc8dfc394b5bdad0.jpg
```