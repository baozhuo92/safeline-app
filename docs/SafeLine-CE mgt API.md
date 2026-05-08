---
title: SafeLine-CE mgt API
language_tabs:
  - shell: Shell
  - http: HTTP
  - javascript: JavaScript
  - ruby: Ruby
  - python: Python
  - php: PHP
  - java: Java
  - go: Go
toc_footers: []
includes: []
search: true
code_clipboard: true
highlight_theme: darkula
headingLevel: 2
generator: "@tarslib/widdershins v4.0.30"

---

# SafeLine-CE mgt API

SafeLine-CE mgt API swagger document.

Base URLs:

# Authentication

# settings

## GET get blocking message

GET /ManagerInfo

> 返回示例

> 200 Response

```json
{
  "data": {
    "data": {
      "common_color": {
        "font_color": null,
        "light_font_color": null,
        "light_primary_color": null,
        "primary_color": null,
        "success_color": null
      },
      "error_color": {
        "warning_color": null,
        "warning_font_color": null,
        "warning_light_font_color": null
      },
      "manager_info": "string",
      "page_manager_info": {
        "property1": "string",
        "property2": "string"
      }
    }
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## PUT update blocking message

PUT /ManagerInfo

> Body 请求参数

```json
{
  "common_color": {
    "font_color": "string",
    "light_font_color": "string",
    "light_primary_color": "string",
    "primary_color": "string",
    "success_color": "string"
  },
  "error_color": {
    "warning_color": "string",
    "warning_font_color": "string",
    "warning_light_font_color": "string"
  },
  "manager_info": "string",
  "page_manager_info": {
    "property1": "string",
    "property2": "string"
  }
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[api.PutManagerInfoReq](#schemaapi.putmanagerinforeq)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## GET get block pages

GET /commercial/block_page

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|type|query|string| 否 |none|

> 返回示例

> 200 Response

```json
{
  "data": {
    "content": "string"
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## PUT update block pages

PUT /commercial/block_page

> Body 请求参数

```json
{
  "recover": true,
  "response_html": "string",
  "type": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[api.PutSpecialPageRequest](#schemaapi.putspecialpagerequest)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## GET list block pages

GET /commercial/block_page_list

> 返回示例

> 200 Response

```json
{
  "data": [
    {
      "custom": true,
      "type": "string"
    }
  ],
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## GET get malicious ip sharing plan

GET /open/intelligence

> 返回示例

> 200 Response

```json
{
  "data": {
    "ip_group_id": 0,
    "policy_rule_id": 0,
    "share_enabled": true,
    "updated_at": "string",
    "use_commercial_lib": true
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## POST update malicious ip sharing plan

POST /open/intelligence

> Body 请求参数

```json
{
  "share_enabled": true
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[api.PutThreatInfoRequest](#schemaapi.putthreatinforequest)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## GET list ip group

GET /open/ipgroup

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|top|query|integer| 否 |none|

> 返回示例

> 200 Response

```json
{
  "data": {
    "nodes": [
      {
        "builtin": true,
        "comment": "string",
        "id": 0,
        "ips": [
          null
        ],
        "reference": "string",
        "total": 0,
        "updated_at": "string"
      }
    ],
    "total": 0
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## PUT update ip group

PUT /open/ipgroup

> Body 请求参数

```json
{
  "builtin": true,
  "comment": "string",
  "id": 0,
  "ips": [
    "string"
  ],
  "reference": "string",
  "total": 0,
  "updated_at": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[ipg.IPGroupVO](#schemaipg.ipgroupvo)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## POST create ip group

POST /open/ipgroup

> Body 请求参数

```json
{
  "builtin": true,
  "comment": "string",
  "id": 0,
  "ips": [
    "string"
  ],
  "reference": "string",
  "total": 0,
  "updated_at": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[ipg.IPGroupVO](#schemaipg.ipgroupvo)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": 0,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## DELETE delete ip group

DELETE /open/ipgroup

> Body 请求参数

```json
{
  "ids": [
    0
  ]
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[api.DeleteIPGroupReq](#schemaapi.deleteipgroupreq)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## POST add ip to ip group

POST /open/ipgroup/append

> Body 请求参数

```json
{
  "ip_group_ids": [
    0
  ],
  "ips": [
    "string"
  ]
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[api.PostAppendIPGroupRequest](#schemaapi.postappendipgrouprequest)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## GET get search engine spider group id

GET /open/ipgroup/crawler

> 返回示例

> 200 Response

```json
{
  "data": 0,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## POST update search engine spider

POST /open/ipgroup/crawler

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## GET get ip group detail

GET /open/ipgroup/detail

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|query|integer| 否 |none|

> 返回示例

> 200 Response

```json
{
  "data": {
    "data": {
      "builtin": true,
      "comment": "string",
      "id": 0,
      "ips": [
        "string"
      ],
      "reference": "string",
      "total": 0,
      "updated_at": "string"
    }
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## GET get ip by link

GET /open/ipgroup/link

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|href|query|string| 否 |none|

> 返回示例

> 200 Response

```json
{
  "data": {
    "ips": [
      "string"
    ]
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## POST create ip group by link

POST /open/ipgroup/link

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|comment|query|string| 否 |none|
|url|query|string| 否 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## GET get share user behaviour for waf

GET /open/share_behaviour

> 返回示例

> 200 Response

```json
{
  "data": true,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## POST set share user behaviour info for waf

POST /open/share_behaviour

> Body 请求参数

```json
{
  "enable": true
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[api.SetShareBehaviourRequest](#schemaapi.setsharebehaviourrequest)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## GET get share browser fingerprint info at block page or not

GET /open/share_fingerprint

> 返回示例

> 200 Response

```json
{
  "data": true,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## POST set share browser fingerprint info at block page or not

POST /open/share_fingerprint

> Body 请求参数

```json
{
  "enable": true
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[api.SetShareFingerprintRequest](#schemaapi.setsharefingerprintrequest)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

# system

## GET get login security config

GET /business/account

> 返回示例

> 200 Response

```json
{
  "data": {
    "access_whitelist": [
      "string"
    ],
    "expired_unit": "day",
    "login_expire": 0,
    "password_complex": [
      0
    ],
    "password_expire_day": 0,
    "password_length": 0
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

#### 枚举值

|属性|值|
|---|---|
|expired_unit|day|
|expired_unit|hour|
|expired_unit|minute|

## POST set login security config

POST /business/account

> Body 请求参数

```json
{
  "access_whitelist": [
    "string"
  ],
  "expired_unit": "day",
  "login_expire": 0,
  "password_complex": [
    0
  ],
  "password_expire_day": 0,
  "password_length": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[model.AccountConfig](#schemamodel.accountconfig)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## GET get audit logs

GET /business/audit_log

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|page|query|integer| 否 |none|
|page_size|query|integer| 否 |none|

> 返回示例

> 200 Response

```json
{
  "data": {
    "data": [
      {
        "content": "string",
        "created_at": 0,
        "id": 0,
        "ip": "string",
        "username": "string"
      }
    ],
    "total": 0
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## GET get frontend style

GET /business/frontend_style

> 返回示例

> 200 Response

```json
{
  "data": {
    "icon": "string",
    "title": "string"
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## PUT set frontend style

PUT /business/frontend_style

> Body 请求参数

```json
{
  "icon": "string",
  "title": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[business.PutFrontendStyleReq](#schemabusiness.putfrontendstylereq)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## GET get syslog config

GET /commercial/syslog

> 返回示例

> 200 Response

```json
{
  "data": {
    "host": "string",
    "label": "string",
    "log_types": [
      "string"
    ],
    "port": 0,
    "protocol": "string",
    "rfc": "string",
    "type": "string"
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## PUT update syslog config

PUT /commercial/syslog

> Body 请求参数

```json
{
  "host": "string",
  "label": "string",
  "log_types": [
    "string"
  ],
  "port": 0,
  "protocol": "string",
  "rfc": "string",
  "type": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[model.ReceiverConfig](#schemamodel.receiverconfig)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## POST syslog test

POST /commercial/syslog/test

> Body 请求参数

```json
{
  "host": "string",
  "label": "string",
  "log_types": [
    "string"
  ],
  "port": 0,
  "protocol": "string",
  "rfc": "string",
  "type": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[model.ReceiverConfig](#schemamodel.receiverconfig)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## GET get attack alert config

GET /commercial/webhook

> 返回示例

> 200 Response

```json
{
  "data": {
    "acl_request_enable": true,
    "attack_enable": true,
    "ding_talk": {
      "sign": "string",
      "url": "string"
    },
    "discord": {
      "url": "string"
    },
    "enable": true,
    "fly_book": {
      "sign": "string",
      "url": "string"
    },
    "qiye_weixin": {
      "url": "string"
    },
    "telegram": {
      "chat_id": 0,
      "token": "string"
    }
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## PUT update attack alert config

PUT /commercial/webhook

> Body 请求参数

```json
{
  "acl_request_enable": true,
  "attack_enable": true,
  "ding_talk": {
    "sign": "string",
    "url": "string"
  },
  "discord": {
    "url": "string"
  },
  "enable": true,
  "fly_book": {
    "sign": "string",
    "url": "string"
  },
  "qiye_weixin": {
    "url": "string"
  },
  "telegram": {
    "chat_id": 0,
    "token": "string"
  }
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[webhook.WebhookConfig](#schemawebhook.webhookconfig)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## PUT attack alert config test

PUT /commercial/webhook/test

> Body 请求参数

```json
{
  "type": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[api.TestWebHookConfig](#schemaapi.testwebhookconfig)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## GET get downgrade status

GET /open/Commercial/downgrade

> 返回示例

> 200 Response

```json
{
  "data": {
    "status": true
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## PUT downgrade

PUT /open/Commercial/downgrade

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## GET get API token

GET /open/auth/token

> 返回示例

> 200 Response

```json
{
  "data": "string",
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## PUT update API token

PUT /open/auth/token

> 返回示例

> 200 Response

```json
{
  "data": "string",
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## DELETE delete API token

DELETE /open/auth/token

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## GET get detector performance

GET /open/detector

> 返回示例

> 200 Response

```json
{
  "data": {
    "mode": 0
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## POST update detector performance

POST /open/detector

> Body 请求参数

```json
{
  "mode": 0,
  "ts": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[api.PostDetectorReq](#schemaapi.postdetectorreq)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## GET get clear data interval

GET /open/global/log_clean

> 返回示例

> 200 Response

```json
{
  "data": {
    "max_day": 0,
    "max_stat_day": 0
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## POST update clear data interval

POST /open/global/log_clean

> Body 请求参数

```json
{
  "max_day": 0,
  "max_stat_day": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[api.LogMaxDayConfig](#schemaapi.logmaxdayconfig)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## GET get system info

GET /open/system

> 返回示例

> 200 Response

```json
{
  "data": {
    "cert_id": 0,
    "deprecated": true,
    "license": {
      "valid": true
    },
    "machine_id": "string",
    "outdated": true,
    "oversea": true,
    "password_expire_day": 0,
    "slave": true,
    "staging": true,
    "time": "string",
    "version": "string"
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## PUT update management cert

PUT /open/system

> Body 请求参数

```json
{
  "cert_id": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[system.UpdateReq](#schemasystem.updatereq)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## GET get system arch

GET /open/system/arch

> 返回示例

> 200 Response

```json
{
  "data": "string",
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## GET get protocol status

GET /open/system/protocol

> 返回示例

> 200 Response

```json
{
  "data": true,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## POST update protocol status

POST /open/system/protocol

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

# anti_tamper

## GET get anti tamper detail

GET /business/anti_tamper/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer| 是 |anti_tamper id|

> 返回示例

> 200 Response

```json
{
  "data": {
    "cache_sha256": "string",
    "cache_time": 0,
    "change_sha256": "string",
    "change_time": 0,
    "changed": true,
    "content_type": "string",
    "created_at": 0,
    "id": 0,
    "path": "string",
    "site_id": 0,
    "updated_at": 0
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## PUT update anti tamper

PUT /business/anti_tamper/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer| 是 |anti_tamper id|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## DELETE delete anti tamper

DELETE /business/anti_tamper/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer| 是 |anti_tamper id|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## GET get anti tamper page

GET /business/anti_tamper/{id}/page

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer| 是 |anti_tamper id|
|content|query|integer| 是 |none|

> 返回示例

> 200 Response

```
{}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|

### 返回数据结构

## GET list site anti tamper

GET /business/site/{site_id}/anti_tamper

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|site_id|path|integer| 是 |site_id|
|changed|query|boolean| 否 |none|

> 返回示例

> 200 Response

```json
{
  "data": {
    "data": [
      {
        "cache_time": 0,
        "changed": true,
        "created_at": 0,
        "id": 0,
        "path": "string",
        "site_id": 0,
        "updated_at": 0
      }
    ],
    "refresh_state": "string",
    "refresh_time": 0
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## PUT refresh anti tamper

PUT /business/site/{site_id}/anti_tamper

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|site_id|path|integer| 是 |site_id|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## POST create anti tamper

POST /business/site/{site_id}/anti_tamper

> Body 请求参数

```json
{
  "resource_ids": [
    0
  ]
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|site_id|path|integer| 是 |site_id|
|body|body|[site.AntiTamperCreateReq](#schemasite.antitampercreatereq)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## GET get anti tamper resource

GET /business/site/{site_id}/anti_tamper/resource/{resource_id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|site_id|path|integer| 是 |site id|
|resource_id|path|integer| 是 |resource id|

> 返回示例

> 200 Response

```
{}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|

### 返回数据结构

# report

## GET list report

GET /business/report

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|name|query|string| 否 |none|
|page|query|integer| 否 |none|
|page_size|query|integer| 否 |none|

> 返回示例

> 200 Response

```json
{
  "data": {
    "data": [
      {
        "created_at": 0,
        "error": "string",
        "id": 0,
        "name": "string",
        "state": "string"
      }
    ],
    "total": 0
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## POST create report

POST /business/report

> Body 请求参数

```json
{
  "begin_time": 0,
  "end_time": 0,
  "name": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[report.CreateReq](#schemareport.createreq)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## GET get report detail

GET /business/report/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer| 是 |report id|

> 返回示例

> 200 Response

```json
{
  "data": {
    "begin_time": 0,
    "created_at": 0,
    "data": {
      "attack": {
        "src_ip": null,
        "type": null,
        "website": null
      },
      "count": {
        "intercept": null,
        "ip": null,
        "request": null,
        "uv": null,
        "website": null
      },
      "geo": {
        "intercept_country": null,
        "intercept_province": null,
        "request_country": null,
        "request_province": null
      },
      "trend": {
        "intercept": null,
        "request": null
      }
    },
    "end_time": 0,
    "error": "string",
    "id": 0,
    "name": "string",
    "state": "string"
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## DELETE delete report

DELETE /business/report/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer| 是 |report id|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

# attacks

## GET export attack logs

GET /commercial/record/export

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|action|query|string| 否 |none|
|attack_type|query|string| 否 |none|
|end|query|integer| 否 |none|
|event_id|query|string| 否 |none|
|host|query|string| 否 |none|
|ip|query|string| 否 |none|
|port|query|string| 否 |none|
|start|query|integer| 否 |none|
|type|query|string| 否 |none|
|url|query|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|string|

## GET get attack events

GET /open/events

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|end|query|integer| 否 |none|
|host|query|string| 否 |none|
|ip|query|string| 否 |none|
|page|query|integer| 否 |none|
|page_size|query|integer| 否 |none|
|port|query|string| 否 |none|
|start|query|integer| 否 |none|

> 返回示例

> 200 Response

```json
{
  "data": {
    "nodes": [
      {
        "city": "string",
        "country": "string",
        "deny_count": 0,
        "dst_port": 0,
        "end_at": 0,
        "finished": true,
        "host": "string",
        "id": 0,
        "ip": "string",
        "pass_count": 0,
        "protocol": 0,
        "province": "string",
        "start_at": 0,
        "updated_at": 0
      }
    ],
    "total": 0
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## GET get attack log detail

GET /open/record/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|string| 是 |log id|

> 返回示例

> 200 Response

```json
{
  "data": {
    "action": 0,
    "attack_type": 0,
    "city": "string",
    "country": "string",
    "decode_path": "string",
    "dst_ip": "string",
    "dst_port": 0,
    "eventId": "string",
    "event_id": "string",
    "host": "string",
    "id": 0,
    "lat": "string",
    "lng": "string",
    "location": "string",
    "method": "string",
    "module": "string",
    "payload": "string",
    "policy_name": "string",
    "protocol": 0,
    "province": "string",
    "query_string": "string",
    "reason": "string",
    "req_body": "string",
    "req_header": "string",
    "risk_level": 0,
    "rsp_body": "string",
    "rsp_header": "string",
    "rule_id": "string",
    "rule_id_list": [
      "string"
    ],
    "short_rule_id": "string",
    "site_uuid": "string",
    "socket_ip": "string",
    "src_ip": "string",
    "src_port": 0,
    "status_code": 0,
    "timestamp": 0,
    "url_path": "string",
    "website": "string"
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## GET get attack logs

GET /open/records

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|action|query|string| 否 |none|
|attack_type|query|string| 否 |none|
|end|query|integer| 否 |none|
|event_id|query|string| 否 |none|
|host|query|string| 否 |none|
|ip|query|string| 否 |none|
|page|query|integer| 否 |none|
|page_size|query|integer| 否 |none|
|port|query|string| 否 |none|
|start|query|integer| 否 |none|
|url|query|string| 否 |none|

> 返回示例

> 200 Response

```json
{
  "data": {
    "data": [
      {
        "action": 0,
        "attack_type": 0,
        "city": "string",
        "country": "string",
        "decode_path": "string",
        "dst_ip": "string",
        "dst_port": 0,
        "eventId": "string",
        "event_id": "string",
        "host": "string",
        "id": 0,
        "lat": "string",
        "lng": "string",
        "location": "string",
        "method": "string",
        "module": "string",
        "payload": "string",
        "policy_name": "string",
        "protocol": 0,
        "province": "string",
        "query_string": "string",
        "reason": "string",
        "req_body": "string",
        "req_header": "string",
        "risk_level": 0,
        "rsp_body": "string",
        "rsp_header": "string",
        "rule_id": "string",
        "rule_id_list": [
          null
        ],
        "short_rule_id": "string",
        "site_uuid": "string",
        "socket_ip": "string",
        "src_ip": "string",
        "src_port": 0,
        "status_code": 0,
        "timestamp": 0,
        "url_path": "string",
        "website": "string"
      }
    ],
    "total": 0
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

# enhance_rule

## PUT update enhance rule

PUT /commercial/skynet/rule

> Body 请求参数

```json
{
  "global": true,
  "id": "string",
  "mode": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[api.PutSkynetRuleReq](#schemaapi.putskynetrulereq)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## GET get enhance rule

GET /open/skynet/rule

> 返回示例

> 200 Response

```json
{
  "data": {
    "rules": {
      "property1": {
        "attack_type": 0,
        "id": "string",
        "mode": "string",
        "name": "string",
        "risk_level": 0
      },
      "property2": {
        "attack_type": 0,
        "id": "string",
        "mode": "string",
        "name": "string",
        "risk_level": 0
      }
    }
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## GET get enhance rule global status

GET /open/skynet/rule/switch

> 返回示例

> 200 Response

```json
{
  "data": true,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## PUT update enhance rule global status

PUT /open/skynet/rule/switch

> Body 请求参数

```json
{
  "enable": true
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[api.PutSkynetRuleSwitchReq](#schemaapi.putskynetruleswitchreq)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

# ratelimit

## PUT ratelimit unblock

PUT /open/acl/relieve

> Body 请求参数

```json
{
  "id": 0,
  "ip": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[api.ACLRelieveRequest](#schemaapi.aclrelieverequest)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## GET get global ratelimit config

GET /open/global/acl

> 返回示例

> 200 Response

```json
{
  "data": {
    "attack": {
      "action": "string",
      "block_min": 0,
      "count": 0,
      "enabled": true,
      "exclude_content_type": [
        "string"
      ],
      "period": 0,
      "status_code": [
        0
      ],
      "use_global": true
    },
    "error": {
      "action": "string",
      "block_min": 0,
      "count": 0,
      "enabled": true,
      "exclude_content_type": [
        "string"
      ],
      "period": 0,
      "status_code": [
        0
      ],
      "use_global": true
    },
    "req": {
      "action": "string",
      "block_min": 0,
      "count": 0,
      "enabled": true,
      "exclude_content_type": [
        "string"
      ],
      "period": 0,
      "status_code": [
        0
      ],
      "use_global": true
    }
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## POST set global ratelimit config

POST /open/global/acl

> Body 请求参数

```json
{
  "attack": {
    "action": "string",
    "block_min": 0,
    "count": 0,
    "enabled": true,
    "exclude_content_type": [
      "string"
    ],
    "period": 0,
    "status_code": [
      0
    ],
    "use_global": true
  },
  "error": {
    "action": "string",
    "block_min": 0,
    "count": 0,
    "enabled": true,
    "exclude_content_type": [
      "string"
    ],
    "period": 0,
    "status_code": [
      0
    ],
    "use_global": true
  },
  "req": {
    "action": "string",
    "block_min": 0,
    "count": 0,
    "enabled": true,
    "exclude_content_type": [
      "string"
    ],
    "period": 0,
    "status_code": [
      0
    ],
    "use_global": true
  }
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[acl.SiteACLConfig](#schemaacl.siteaclconfig)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": {
    "attack": {
      "action": "string",
      "block_min": 0,
      "count": 0,
      "enabled": true,
      "exclude_content_type": [
        "string"
      ],
      "period": 0,
      "status_code": [
        0
      ],
      "use_global": true
    },
    "error": {
      "action": "string",
      "block_min": 0,
      "count": 0,
      "enabled": true,
      "exclude_content_type": [
        "string"
      ],
      "period": 0,
      "status_code": [
        0
      ],
      "use_global": true
    },
    "req": {
      "action": "string",
      "block_min": 0,
      "count": 0,
      "enabled": true,
      "exclude_content_type": [
        "string"
      ],
      "period": 0,
      "status_code": [
        0
      ],
      "use_global": true
    }
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## GET get ratelimit log

GET /open/records/acl

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|created_at_begin|query|integer| 否 |none|
|created_at_end|query|integer| 否 |none|
|ip|query|string| 否 |none|
|page|query|integer| 否 |none|
|page_size|query|integer| 否 |none|
|site|query|string| 否 |none|

> 返回示例

> 200 Response

```json
{
  "data": {
    "data": [
      {
        "action": "[",
        "block_min": 0,
        "city": "string",
        "count": 0,
        "country": "string",
        "created_at": "string",
        "denied_count": 0,
        "id": 0,
        "ip": "string",
        "period": 0,
        "province": "string",
        "reason": "[",
        "result": "string",
        "site_comment": "string",
        "site_icon": "string",
        "site_id": 0,
        "site_server_names": [
          null
        ],
        "site_title": "string",
        "status": 0,
        "updated_at": "string",
        "valid_before": "string"
      }
    ],
    "total": 0
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

#### 枚举值

|属性|值|
|---|---|
|action|ban|
|action|challenge|
|reason|req|
|reason|attack|
|reason|error|

# user

## GET get csrf token

GET /open/auth/csrf

> 返回示例

> 200 Response

```json
{
  "data": {
    "csrf_token": "string"
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## POST username password login

POST /open/auth/login

> Body 请求参数

```json
{
  "csrf_token": "string",
  "password": "string",
  "username": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[auth.LoginReq](#schemaauth.loginreq)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": {
    "id": 0,
    "jwt": "string",
    "tfa_bind_url": "string",
    "tfa_binded": true,
    "tfa_enabled": true
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## POST logout

POST /open/auth/logout

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## POST tfa login

POST /open/auth/tfa

> Body 请求参数

```json
{
  "code": "string",
  "csrf_token": "string",
  "timestamp": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[auth.TfaReq](#schemaauth.tfareq)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": {
    "jwt": "string"
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## GET list user

GET /open/users

> 返回示例

> 200 Response

```json
{
  "data": {
    "data": [
      {
        "id": 0,
        "last_login": 0,
        "password_enabled": true,
        "pwd_updated_at": 0,
        "role": "[",
        "tfa_binded": true,
        "tfa_enabled": true,
        "username": "string"
      }
    ]
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

#### 枚举值

|属性|值|
|---|---|
|role|0|
|role|1|
|role|2|
|role|3|
|role|4|
|role|5|

## PUT update user

PUT /open/users

> Body 请求参数

```json
{
  "id": 0,
  "password": "string",
  "role": 0,
  "tfa_enabled": true,
  "username": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[user.UpdateUserReq](#schemauser.updateuserreq)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## POST create user

POST /open/users

> Body 请求参数

```json
{
  "password": "string",
  "role": 0,
  "tfa_enabled": true,
  "username": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[user.CreateUserReq](#schemauser.createuserreq)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": {
    "id": 0
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## DELETE delete user

DELETE /open/users

> Body 请求参数

```json
{
  "id": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[user.DeleteUserReq](#schemauser.deleteuserreq)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## POST reset user totp

POST /open/users/{id}/totp

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer| 是 |user id|

> 返回示例

> 200 Response

```json
{
  "data": {
    "id": 0
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

# auth

## GET list auth source

GET /open/auth_defense/source

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|related_sites|query|boolean| 否 |none|

> 返回示例

> 200 Response

```json
{
  "data": {
    "data": [
      {
        "comment": "string",
        "id": 0,
        "related_sites": [
          null
        ],
        "total_user": 0,
        "type": "[",
        "valid_user": 0
      }
    ]
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

#### 枚举值

|属性|值|
|---|---|
|type|0|
|type|1|
|type|2|
|type|3|

## POST create auth source

POST /open/auth_defense/source

> Body 请求参数

```json
{
  "auth": {
    "oauth2": {
      "app_id": "string",
      "app_secret": "string"
    }
  },
  "comment": "string",
  "type": 0,
  "user": [
    {
      "password": "string",
      "username": "string"
    }
  ]
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[auth_defense.CreateSourceReq](#schemaauth_defense.createsourcereq)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": 0,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## GET list auth source

GET /open/auth_defense/source/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer| 是 |source id|

> 返回示例

> 200 Response

```json
{
  "data": {
    "auth": {
      "oauth2": {
        "app_id": null,
        "app_secret": null
      }
    },
    "comment": "string",
    "created_at": "string",
    "id": 0,
    "type": 0,
    "updated_at": "string",
    "user": [
      {
        "password": "string",
        "username": "string"
      }
    ]
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

#### 枚举值

|属性|值|
|---|---|
|type|0|
|type|1|
|type|2|
|type|3|

## PUT update auth source

PUT /open/auth_defense/source/{id}

> Body 请求参数

```json
{
  "auth": {
    "oauth2": {
      "app_id": "string",
      "app_secret": "string"
    }
  },
  "comment": "string",
  "user": [
    {
      "password": "string",
      "username": "string"
    }
  ]
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer| 是 |source id|
|body|body|[auth_defense.UpdateSourceReq](#schemaauth_defense.updatesourcereq)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## DELETE update auth source

DELETE /open/auth_defense/source/{id}

> Body 请求参数

```json
{
  "auth": {
    "oauth2": {
      "app_id": "string",
      "app_secret": "string"
    }
  },
  "comment": "string",
  "user": [
    {
      "password": "string",
      "username": "string"
    }
  ]
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer| 是 |source id|
|body|body|[auth_defense.UpdateSourceReq](#schemaauth_defense.updatesourcereq)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## GET list auth source user

GET /open/auth_defense/source/{id}/user

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer| 是 |source id|
|page|query|integer| 否 |none|
|page_size|query|integer| 否 |none|
|uname|query|string| 否 |none|

> 返回示例

> 200 Response

```json
{
  "data": {
    "approved_total": 0,
    "data": [
      {
        "id": 0,
        "last_login": 0,
        "status": "[",
        "uname": "string"
      }
    ],
    "total": 0,
    "user_total": 0
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

#### 枚举值

|属性|值|
|---|---|
|status|0|
|status|1|
|status|2|

## PUT update auth source user

PUT /open/auth_defense/source/{id}/user/{user_id}

> Body 请求参数

```json
{
  "status": 1
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer| 是 |source id|
|user_id|path|integer| 是 |source user id|
|body|body|[auth_defense.PutSourceUserReq](#schemaauth_defense.putsourceuserreq)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## DELETE update auth source user

DELETE /open/auth_defense/source/{id}/user/{user_id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer| 是 |source id|
|user_id|path|integer| 是 |source user id|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## GET get auth logs

GET /open/records/auth_defense

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|ip|query|string| 否 |none|
|page|query|integer| 否 |none|
|page_size|query|integer| 否 |none|
|site|query|string| 否 |none|
|started_at_begin|query|integer| 否 |none|
|started_at_end|query|integer| 否 |none|

> 返回示例

> 200 Response

```json
{
  "data": {
    "data": [
      {
        "city": "string",
        "country": "string",
        "created_at": "string",
        "deny_count": 0,
        "dur_sec": 0,
        "ended_at": 0,
        "event_id": "string",
        "id": 0,
        "ip": "string",
        "pass_count": 0,
        "province": "string",
        "rule_id": 0,
        "site_comment": "string",
        "site_icon": "string",
        "site_id": 0,
        "site_server_names": [
          null
        ],
        "site_title": "string",
        "started_at": 0,
        "trigger_count": 0,
        "updated_at": "string",
        "username": "string"
      }
    ],
    "total": 0
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## GET get auth logs v2

GET /open/v2/records/auth_defense

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|begin|query|integer| 否 |none|
|end|query|integer| 否 |none|
|ip|query|string| 否 |none|
|page|query|integer| 否 |none|
|page_size|query|integer| 否 |none|
|result|query|boolean| 否 |none|
|site|query|string| 否 |none|
|username|query|string| 否 |none|

> 返回示例

> 200 Response

```json
{
  "data": {
    "data": [
      {
        "auth_source_id": 0,
        "city": "string",
        "country": "string",
        "created_at": "string",
        "id": 0,
        "ip": "string",
        "policy_id": 0,
        "province": "string",
        "result": true,
        "site_comment": "string",
        "site_icon": "string",
        "site_id": 0,
        "site_server_names": [
          null
        ],
        "site_title": "string",
        "source_type": "[",
        "updated_at": "string",
        "username": "string"
      }
    ],
    "total": 0
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

#### 枚举值

|属性|值|
|---|---|
|source_type|0|
|source_type|1|
|source_type|2|
|source_type|3|

# ssl_cert

## GET list cert

GET /open/cert

> 返回示例

> 200 Response

```json
{
  "data": {
    "nodes": [
      {
        "acme_message": "string",
        "domains": [
          null
        ],
        "expired": true,
        "id": 0,
        "issuer": "string",
        "related_sites": [
          null
        ],
        "revoked": true,
        "self_signature": true,
        "trusted": true,
        "type": 0,
        "valid_before": "string"
      }
    ],
    "total": 0
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## POST upsert cert

POST /open/cert

> Body 请求参数

```json
{
  "acme": {
    "domains": [
      "string"
    ],
    "email": "string"
  },
  "id": 0,
  "manual": {
    "crt": "string",
    "key": "string"
  },
  "type": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[cert.CertDetail](#schemacert.certdetail)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": 0,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## GET get cert detail

GET /open/cert/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer| 是 |cert id|

> 返回示例

> 200 Response

```json
{
  "data": {
    "acme": {
      "domains": [
        "string"
      ],
      "email": "string"
    },
    "id": 0,
    "manual": {
      "crt": "string",
      "key": "string"
    },
    "type": 0
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## DELETE delete cert

DELETE /open/cert/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer| 是 |cert id|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

# cloud

## GET get cloud policies

GET /open/cloud/policies

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|name|query|string| 否 |name|

> 返回示例

> 200 Response

```json
[
  {
    "added": true,
    "auth_rule": 0,
    "black_rule": 0,
    "captcha_rule": 0,
    "compatible": 0,
    "created_at": "string",
    "id": 0,
    "org_name": "string",
    "policy_name": "string",
    "tags": [
      "string"
    ],
    "updated_at": "string",
    "white_rule": 0
  }
]
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|*anonymous*|[[git_in_chaitin_net_patronus_safeline-2_management_webserver_api_cloud.ListItem](#schemagit_in_chaitin_net_patronus_safeline-2_management_webserver_api_cloud.listitem)]|false|none||none|
|» added|boolean|false|none||none|
|» auth_rule|integer|false|none||none|
|» black_rule|integer|false|none||none|
|» captcha_rule|integer|false|none||none|
|» compatible|integer|false|none||none|
|» created_at|string|false|none||none|
|» id|integer|false|none||none|
|» org_name|string|false|none||none|
|» policy_name|string|false|none||none|
|» tags|[string]|false|none||none|
|» updated_at|string|false|none||none|
|» white_rule|integer|false|none||none|

## POST subscribe cloud policy

POST /open/cloud/policies/subscribe

> Body 请求参数

```json
{
  "id": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[cloud.SubCloudPolicyReq](#schemacloud.subcloudpolicyreq)| 是 |none|

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|None|

# statistics

## GET get basic intercepts last 30 days

GET /open/dashboard/intercepts

> 返回示例

> 200 Response

```json
{
  "data": {
    "nodes": [
      {
        "label": "string",
        "value": 0
      }
    ],
    "total": 0
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## GET get basic requests last 30 days

GET /open/dashboard/requests

> 返回示例

> 200 Response

```json
{
  "data": {
    "nodes": [
      {
        "label": "string",
        "value": 0
      }
    ],
    "total": 0
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## GET get basic access info

GET /open/dashboard/user/counts

> 返回示例

> 200 Response

```json
{
  "data": {
    "ip": [
      {
        "label": "string",
        "value": 0
      }
    ],
    "pv": [
      {
        "label": "string",
        "value": 0
      }
    ],
    "today_ip": 0,
    "today_pv": 0,
    "today_uv": 0,
    "uv": [
      {
        "label": "string",
        "value": 0
      }
    ]
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## GET get advanced access

GET /stat/advance/access

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|begin_time|query|integer| 否 |none|
|end_time|query|integer| 否 |none|

> 返回示例

> 200 Response

```json
{
  "data": {
    "access": 0,
    "ip": 0,
    "session": 0
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## GET get advanced intercept

GET /stat/advance/attack

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|begin_time|query|integer| 否 |none|
|end_time|query|integer| 否 |none|

> 返回示例

> 200 Response

```json
{
  "data": {
    "attack_ip": 0,
    "intercept": {
      "auth_defense": 0,
      "block": 0,
      "challenge": 0,
      "offline": 0,
      "rate_limit": 0
    }
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## GET get advanced client

GET /stat/advance/client

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|begin_time|query|integer| 否 |none|
|end_time|query|integer| 否 |none|
|size|query|integer| 否 |none|

> 返回示例

> 200 Response

```json
{
  "data": {
    "browser": [
      {
        "browser": "string",
        "count": 0
      }
    ],
    "os": [
      {
        "count": 0,
        "os": "string"
      }
    ]
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## GET get advanced domain

GET /stat/advance/domain

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|begin_time|query|integer| 否 |none|
|end_time|query|integer| 否 |none|
|refer|query|boolean| 否 |none|
|size|query|integer| 否 |none|

> 返回示例

> 200 Response

```json
{
  "data": [
    {
      "count": 0,
      "domain": "string"
    }
  ],
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## GET get advanced error status code

GET /stat/advance/error_status_code

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|begin_time|query|integer| 否 |none|
|end_time|query|integer| 否 |none|

> 返回示例

> 200 Response

```json
{
  "data": {
    "error_4xx": 0,
    "error_5xx": 0,
    "total": 0
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## GET get advanced geolocation

GET /stat/advance/location

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|action|query|integer| 否 |none|
|begin_time|query|integer| 否 |none|
|end_time|query|integer| 否 |none|
|global|query|boolean| 否 |none|
|size|query|integer| 否 |none|

> 返回示例

> 200 Response

```json
{
  "data": [
    {
      "count": 0,
      "country": "string",
      "province": "string"
    }
  ],
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## GET get advanced page

GET /stat/advance/page

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|begin_time|query|integer| 否 |none|
|end_time|query|integer| 否 |none|
|refer|query|boolean| 否 |none|
|size|query|integer| 否 |none|

> 返回示例

> 200 Response

```json
{
  "data": [
    {
      "count": 0,
      "page": "string"
    }
  ],
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## GET get advanced status code

GET /stat/advance/status_code

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|begin_time|query|integer| 否 |none|
|end_time|query|integer| 否 |none|
|size|query|integer| 否 |none|

> 返回示例

> 200 Response

```json
{
  "data": [
    {
      "count": 0,
      "status_code": "string"
    }
  ],
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## GET get advanced access trend

GET /stat/advance/trend/access

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|begin_time|query|integer| 否 |none|
|end_time|query|integer| 否 |none|

> 返回示例

> 200 Response

```json
{
  "data": [
    {
      "count": 0,
      "time": 0
    }
  ],
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## GET get advanced intercept trend

GET /stat/advance/trend/intercept

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|begin_time|query|integer| 否 |none|
|end_time|query|integer| 否 |none|

> 返回示例

> 200 Response

```json
{
  "data": [
    {
      "count": 0,
      "time": 0
    }
  ],
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## GET get basic access count

GET /stat/basic/access

> 返回示例

> 200 Response

```json
{
  "data": {
    "access": 0
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## GET get basic attack

GET /stat/basic/attack

> 返回示例

> 200 Response

```json
{
  "data": {
    "attack_ip": 0,
    "intercept": {
      "auth_defense": 0,
      "block": 0,
      "challenge": 0,
      "offline": 0,
      "rate_limit": 0
    }
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## GET get basic error status code

GET /stat/basic/error_status_code

> 返回示例

> 200 Response

```json
{
  "data": {
    "error_4xx": 0,
    "error_5xx": 0,
    "total": 0
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## GET get basic geolocation

GET /stat/basic/location

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|global|query|boolean| 否 |global|
|action|query|integer| 否 |action|

> 返回示例

> 200 Response

```json
{
  "data": [
    {
      "count": 0,
      "country": "string",
      "province": "string"
    }
  ],
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## GET get qps

GET /stat/qps

> 返回示例

> 200 Response

```json
{
  "data": {
    "nodes": [
      {
        "property1": null,
        "property2": null
      }
    ]
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

# detection_mod

## GET get detection mod

GET /open/global/mode

> 返回示例

> 200 Response

```json
{
  "data": {
    "semantics": {
      "property1": "string",
      "property2": "string"
    }
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## PUT update detection mod

PUT /open/global/mode

> Body 请求参数

```json
{
  "semantics": {
    "property1": "string",
    "property2": "string"
  }
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[api.GlobalModeConfigParams](#schemaapi.globalmodeconfigparams)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

# global_settings

## GET get global settings

GET /open/global/proxy

> 返回示例

> 200 Response

```json
{
  "data": {
    "br": {
      "global": true,
      "value": true
    },
    "created_at": "string",
    "default_server": {
      "global": true,
      "value": true
    },
    "force_https": {
      "global": true,
      "value": true
    },
    "global_ipv6": {
      "global": true,
      "value": true
    },
    "global_ssl_ciphers": {
      "global": true,
      "value": "string"
    },
    "global_ssl_protocols": {
      "global": true,
      "value": "string"
    },
    "gzip": {
      "global": true,
      "value": true
    },
    "host": {
      "global": true,
      "value": "string"
    },
    "hsts": {
      "global": true,
      "value": true
    },
    "hsts_max_age": {
      "global": true,
      "value": "string"
    },
    "hsts_preload": {
      "global": true,
      "value": true
    },
    "hsts_sub": {
      "global": true,
      "value": true
    },
    "http2": {
      "global": true,
      "value": true
    },
    "http3": {
      "global": true,
      "value": true
    },
    "http_1.0": {
      "global": true,
      "value": true
    },
    "http_headers": {
      "global": true,
      "value": [
        {}
      ]
    },
    "id": 0,
    "ip_source": {
      "global": true,
      "value": "string"
    },
    "ip_value": {
      "global": true,
      "value": "string"
    },
    "ipv6": {
      "global": true,
      "value": true
    },
    "reset_xff": {
      "global": true,
      "value": true
    },
    "site_id": 0,
    "ssl_ciphers": {
      "global": true,
      "value": "string"
    },
    "ssl_protocols": {
      "global": null,
      "value": null
    },
    "updated_at": "string",
    "xfh": {
      "global": true,
      "value": "string"
    },
    "xfp": {
      "global": true,
      "value": "string"
    }
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## PUT set global settings

PUT /open/global/proxy

> Body 请求参数

```json
{
  "br": {
    "global": true,
    "value": true
  },
  "default_server": {
    "global": true,
    "value": true
  },
  "force_https": {
    "global": true,
    "value": true
  },
  "gzip": {
    "global": true,
    "value": true
  },
  "host": {
    "global": true,
    "value": "string"
  },
  "hsts": {
    "global": true,
    "value": true
  },
  "hsts_max_age": {
    "global": true,
    "value": "string"
  },
  "hsts_preload": {
    "global": true,
    "value": true
  },
  "hsts_sub": {
    "global": true,
    "value": true
  },
  "http2": {
    "global": true,
    "value": true
  },
  "http3": {
    "global": true,
    "value": true
  },
  "http_1.0": {
    "global": true,
    "value": true
  },
  "http_headers": {
    "global": true,
    "value": [
      {
        "key": "string",
        "op": "string",
        "target": "string",
        "val": "string"
      }
    ]
  },
  "ip_source": {
    "global": true,
    "value": "string"
  },
  "ip_value": {
    "global": true,
    "value": "string"
  },
  "ipv6": {
    "global": true,
    "value": true
  },
  "reset_xff": {
    "global": true,
    "value": true
  },
  "ssl_ciphers": {
    "global": true,
    "value": "string"
  },
  "ssl_protocols": {
    "global": true,
    "value": "string"
  },
  "xfh": {
    "global": true,
    "value": "string"
  },
  "xfp": {
    "global": true,
    "value": "string"
  }
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[proxy.Config](#schemaproxy.config)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": {
    "br": {
      "global": true,
      "value": true
    },
    "created_at": "string",
    "default_server": {
      "global": true,
      "value": true
    },
    "force_https": {
      "global": true,
      "value": true
    },
    "global_ipv6": {
      "global": true,
      "value": true
    },
    "global_ssl_ciphers": {
      "global": true,
      "value": "string"
    },
    "global_ssl_protocols": {
      "global": true,
      "value": "string"
    },
    "gzip": {
      "global": true,
      "value": true
    },
    "host": {
      "global": true,
      "value": "string"
    },
    "hsts": {
      "global": true,
      "value": true
    },
    "hsts_max_age": {
      "global": true,
      "value": "string"
    },
    "hsts_preload": {
      "global": true,
      "value": true
    },
    "hsts_sub": {
      "global": true,
      "value": true
    },
    "http2": {
      "global": true,
      "value": true
    },
    "http3": {
      "global": true,
      "value": true
    },
    "http_1.0": {
      "global": true,
      "value": true
    },
    "http_headers": {
      "global": true,
      "value": [
        {}
      ]
    },
    "id": 0,
    "ip_source": {
      "global": true,
      "value": "string"
    },
    "ip_value": {
      "global": true,
      "value": "string"
    },
    "ipv6": {
      "global": true,
      "value": true
    },
    "reset_xff": {
      "global": true,
      "value": true
    },
    "site_id": 0,
    "ssl_ciphers": {
      "global": true,
      "value": "string"
    },
    "ssl_protocols": {
      "global": null,
      "value": null
    },
    "updated_at": "string",
    "xfh": {
      "global": true,
      "value": "string"
    },
    "xfp": {
      "global": true,
      "value": "string"
    }
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

# 通用配置

## POST update malicious ip group

POST /open/intelligence/ip_lib

> Body 请求参数

```json
{
  "use_commercial_lib": true
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[api.PutThreatLibRequest](#schemaapi.putthreatlibrequest)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

# customized_rules

## GET list customized rule

GET /open/policy

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|action|query|integer| 否 |none|
|page|query|integer| 否 |none|
|page_size|query|integer| 否 |none|

> 返回示例

> 200 Response

```json
{
  "data": {
    "data": [
      {
        "action": 0,
        "auth_rule": 0,
        "auth_source_ids": [
          null
        ],
        "black_rule": 0,
        "builtin": true,
        "captcha_rule": 0,
        "cloud_id": 0,
        "cloud_total": 0,
        "compatible": 0,
        "created_at": "string",
        "expire": 0,
        "id": 0,
        "is_enabled": true,
        "level": 0,
        "log": true,
        "name": "string",
        "pass_count": 0,
        "pattern": [
          null
        ],
        "replay": true,
        "req_count": 0,
        "updated_at": "string",
        "white_rule": 0
      }
    ],
    "total": 0
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## PUT update customized rule

PUT /open/policy

> Body 请求参数

```json
{
  "action": 0,
  "auth_source_ids": [
    0
  ],
  "expire": 0,
  "id": 0,
  "is_enabled": true,
  "level": 0,
  "log": true,
  "name": "string",
  "pattern": [
    [
      {
        "k": "string",
        "op": "string",
        "sub_k": "string",
        "v": [
          "string"
        ]
      }
    ]
  ]
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[policy.PutPolicyReq](#schemapolicy.putpolicyreq)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## POST create customized rule

POST /open/policy

> Body 请求参数

```json
{
  "action": 0,
  "auth_source_ids": [
    0
  ],
  "expire": 0,
  "is_enabled": true,
  "level": 0,
  "log": true,
  "name": "string",
  "pattern": [
    [
      {
        "k": "string",
        "op": "string",
        "sub_k": "string",
        "v": [
          "string"
        ]
      }
    ]
  ]
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[policy.PostPolicyReq](#schemapolicy.postpolicyreq)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": 0,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## DELETE delete customized rule

DELETE /open/policy

> Body 请求参数

```json
{
  "id": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[policy.DeletePolicyReq](#schemapolicy.deletepolicyreq)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## GET get customized rule detail

GET /open/policy/detail

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|query|integer| 否 |none|

> 返回示例

> 200 Response

```json
{
  "data": {
    "action": 0,
    "auth_rule": 0,
    "auth_source_ids": [
      0
    ],
    "black_rule": 0,
    "builtin": true,
    "captcha_rule": 0,
    "cloud_id": 0,
    "cloud_total": 0,
    "compatible": 0,
    "created_at": "string",
    "expire": 0,
    "id": 0,
    "is_enabled": true,
    "level": 0,
    "log": true,
    "name": "string",
    "pass_count": 0,
    "pattern": [
      [
        {
          "k": null,
          "op": null,
          "sub_k": null,
          "v": null
        }
      ]
    ],
    "replay": true,
    "req_count": 0,
    "updated_at": "string",
    "white_rule": 0
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## PUT enable/disable customized rule

PUT /open/policy/switch

> Body 请求参数

```json
{
  "id": 0,
  "is_enabled": true
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[policy.PutPolicySwitchReq](#schemapolicy.putpolicyswitchreq)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

# anti-bot

## GET list anti-bot log

GET /open/records/challenge

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|ip|query|string| 否 |none|
|page|query|integer| 否 |none|
|page_size|query|integer| 否 |none|
|site|query|string| 否 |none|
|started_at_begin|query|integer| 否 |none|
|started_at_end|query|integer| 否 |none|

> 返回示例

> 200 Response

```json
{
  "data": {
    "data": [
      {
        "city": "string",
        "country": "string",
        "created_at": "string",
        "dur_sec": 0,
        "ended_at": 0,
        "event_id": "string",
        "id": 0,
        "ip": "string",
        "pass_count": 0,
        "province": "string",
        "rule_id": 0,
        "site_comment": "string",
        "site_icon": "string",
        "site_id": 0,
        "site_server_names": [
          null
        ],
        "site_title": "string",
        "started_at": 0,
        "trigger_count": 0,
        "updated_at": "string"
      }
    ],
    "total": 0
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

# WaitingRoom

## GET Get waiting room logs

GET /open/records/waiting

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|page|query|integer| 否 |none|
|page_size|query|integer| 否 |none|
|site|query|string| 否 |none|
|started_at_begin|query|integer| 否 |none|
|started_at_end|query|integer| 否 |none|

> 返回示例

> 200 Response

```json
{
  "data": {
    "data": [
      {
        "avg_wait_sec": 0,
        "bounce_rate": 0,
        "cur_waiting": 0,
        "dur_sec": 0,
        "ended_at": 0,
        "max_concurrent": 0,
        "rule_id": 0,
        "site_comment": "string",
        "site_icon": "string",
        "site_id": 0,
        "site_server_names": [
          null
        ],
        "site_title": "string",
        "started_at": 0,
        "top_waiting": 0,
        "total_waiting": 0
      }
    ],
    "total": 0
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## GET Get website waiting room rule

GET /open/site/{id}/waiting

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer| 是 |website id|

> 返回示例

> 200 Response

```json
{
  "data": {
    "created_at": "string",
    "id": 0,
    "is_enabled": true,
    "max_concurrent": 0,
    "max_waiting": 0,
    "name": "string",
    "session_timeout": 0,
    "updated_at": "string",
    "website_id": 0
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## POST Set website waiting room rule

POST /open/site/{id}/waiting

> Body 请求参数

```json
{
  "is_enabled": true,
  "max_concurrent": 0,
  "session_timeout": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer| 是 |website id|
|body|body|[site.SetWebsiteWaitingRoomReq](#schemasite.setwebsitewaitingroomreq)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": {
    "created_at": "string",
    "id": 0,
    "is_enabled": true,
    "max_concurrent": 0,
    "max_waiting": 0,
    "name": "string",
    "session_timeout": 0,
    "updated_at": "string",
    "website_id": 0
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

# web_services

## GET list web service

GET /open/site

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|order|query|string| 否 |none|
|order_by|query|string| 否 |none|
|page|query|integer| 否 |none|
|page_size|query|integer| 否 |none|

> 返回示例

> 200 Response

```json
{
  "data": {
    "data": [
      {
        "access_log_limit": 0,
        "acl_enabled": true,
        "acl_response_html_path": "string",
        "acl_response_status_code": 0,
        "auth_defense_id": 0,
        "bad_gateway_html_path": "string",
        "bad_gateway_status_code": 0,
        "cc_bot": true,
        "cert_filename": "string",
        "cert_id": 0,
        "cert_type": 0,
        "challenge_id": 0,
        "chaos_id": 0,
        "chaos_is_enabled": true,
        "comment": "string",
        "created_at": "string",
        "custom_location": [
          null
        ],
        "denied_value": 0,
        "email": "string",
        "error_log_limit": 0,
        "exclude_content_type": [
          null
        ],
        "exclude_paths": [
          null
        ],
        "forbidden_html_path": "string",
        "forbidden_status_code": 0,
        "gateway_timeout_html_path": "string",
        "gateway_timeout_status_code": 0,
        "health_check": true,
        "health_state": {},
        "icon": "string",
        "id": 0,
        "index": "string",
        "init": true,
        "is_enabled": true,
        "key_filename": "string",
        "load_balance": {},
        "mode": 0,
        "not_found_html_path": "string",
        "not_found_status_code": 0,
        "offline_html_path": "string",
        "offline_status_code": 0,
        "ports": [
          null
        ],
        "redirect_status_code": 0,
        "req_value": 0,
        "server_names": [
          null
        ],
        "static": true,
        "static_default": 0,
        "tamper_refresh": 0,
        "tamper_refresh_state": "string",
        "title": "string",
        "type": 0,
        "updated_at": "string",
        "upstreams": [
          null
        ],
        "wr_id": 0
      }
    ],
    "total": 0
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## PUT update web service

PUT /open/site

> Body 请求参数

```json
{
  "cert_id": 0,
  "comment": "string",
  "email": "string",
  "health_check": true,
  "id": 0,
  "index": "string",
  "load_balance": {
    "balance_type": 0
  },
  "ports": [
    "string"
  ],
  "redirect_status_code": 0,
  "server_names": [
    "string"
  ],
  "static_default": 0,
  "type": 0,
  "upstreams": [
    "string"
  ]
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[site.WebsiteReq](#schemasite.websitereq)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## POST create web service

POST /open/site

> Body 请求参数

```json
{
  "cert_id": 0,
  "comment": "string",
  "email": "string",
  "health_check": true,
  "id": 0,
  "index": "string",
  "load_balance": {
    "balance_type": 0
  },
  "ports": [
    "string"
  ],
  "redirect_status_code": 0,
  "server_names": [
    "string"
  ],
  "static_default": 0,
  "type": 0,
  "upstreams": [
    "string"
  ]
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[site.WebsiteReq](#schemasite.websitereq)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": 0,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## DELETE delete web service

DELETE /open/site

> Body 请求参数

```json
{
  "ids": [
    0
  ]
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[site.DeleteWebsiteReq](#schemasite.deletewebsitereq)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## PUT update web service anti-bot

PUT /open/site/challenge

> Body 请求参数

```json
{
  "enable": true,
  "expire": 0,
  "id": 0,
  "level": 0,
  "replay": true
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[site.PubWebsiteChallengeReq](#schemasite.pubwebsitechallengereq)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## PUT update web service auth

PUT /open/site/defense

> Body 请求参数

```json
{
  "auth_source_ids": [
    0
  ],
  "enable": true,
  "id": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[site.PutWebsiteDefenseReq](#schemasite.putwebsitedefensereq)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## POST get web service healthcheck

POST /open/site/healthcheck

> Body 请求参数

```json
{
  "hosts": [
    "string"
  ],
  "upstreams": [
    "string"
  ]
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[site.PostWebsiteHealthcheckReq](#schemasite.postwebsitehealthcheckreq)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": {
    "property1": "string",
    "property2": "string"
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## PUT update web service run mode

PUT /open/site/mode

> Body 请求参数

```json
{
  "ids": [
    0
  ],
  "mode": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[site.PutWebsiteModeRequest](#schemasite.putwebsitemoderequest)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## GET get web service detail

GET /open/site/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer| 是 |site id|

> 返回示例

> 200 Response

```json
{
  "data": {
    "access_log_limit": 0,
    "acl_enabled": true,
    "acl_response_html_path": "string",
    "acl_response_status_code": 0,
    "auth_defense_id": 0,
    "bad_gateway_html_path": "string",
    "bad_gateway_status_code": 0,
    "cc_bot": true,
    "cert_filename": "string",
    "cert_id": 0,
    "cert_type": 0,
    "challenge_id": 0,
    "chaos_id": 0,
    "chaos_is_enabled": true,
    "comment": "string",
    "created_at": "string",
    "custom_location": [
      "string"
    ],
    "denied_value": 0,
    "email": "string",
    "error_log_limit": 0,
    "exclude_content_type": [
      "string"
    ],
    "exclude_paths": [
      "string"
    ],
    "forbidden_html_path": "string",
    "forbidden_status_code": 0,
    "gateway_timeout_html_path": "string",
    "gateway_timeout_status_code": 0,
    "health_check": true,
    "health_state": {
      "property1": {
        "error": "string",
        "state": 0
      },
      "property2": {
        "error": "string",
        "state": 0
      }
    },
    "icon": "string",
    "id": 0,
    "index": "string",
    "init": true,
    "is_enabled": true,
    "key_filename": "string",
    "load_balance": {
      "balance_type": 0
    },
    "mode": 0,
    "not_found_html_path": "string",
    "not_found_status_code": 0,
    "offline_html_path": "string",
    "offline_status_code": 0,
    "ports": [
      "string"
    ],
    "redirect_status_code": 0,
    "req_value": 0,
    "server_names": [
      "string"
    ],
    "static": true,
    "static_default": 0,
    "tamper_refresh": 0,
    "tamper_refresh_state": "string",
    "title": "string",
    "type": 0,
    "updated_at": "string",
    "upstreams": [
      "string"
    ],
    "wr_id": 0
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## GET get web service ratelimit config

GET /open/site/{id}/acl

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer| 是 |site id|

> 返回示例

> 200 Response

```json
{
  "data": {
    "attack": {
      "action": "string",
      "block_min": 0,
      "count": 0,
      "enabled": true,
      "exclude_content_type": [
        "string"
      ],
      "period": 0,
      "status_code": [
        0
      ],
      "use_global": true
    },
    "error": {
      "action": "string",
      "block_min": 0,
      "count": 0,
      "enabled": true,
      "exclude_content_type": [
        "string"
      ],
      "period": 0,
      "status_code": [
        0
      ],
      "use_global": true
    },
    "req": {
      "action": "string",
      "block_min": 0,
      "count": 0,
      "enabled": true,
      "exclude_content_type": [
        "string"
      ],
      "period": 0,
      "status_code": [
        0
      ],
      "use_global": true
    }
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## POST set web service ratelimit config

POST /open/site/{id}/acl

> Body 请求参数

```json
{
  "attack": {
    "action": "string",
    "block_min": 0,
    "count": 0,
    "enabled": true,
    "exclude_content_type": [
      "string"
    ],
    "period": 0,
    "status_code": [
      0
    ],
    "use_global": true
  },
  "error": {
    "action": "string",
    "block_min": 0,
    "count": 0,
    "enabled": true,
    "exclude_content_type": [
      "string"
    ],
    "period": 0,
    "status_code": [
      0
    ],
    "use_global": true
  },
  "req": {
    "action": "string",
    "block_min": 0,
    "count": 0,
    "enabled": true,
    "exclude_content_type": [
      "string"
    ],
    "period": 0,
    "status_code": [
      0
    ],
    "use_global": true
  }
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer| 是 |site id|
|body|body|[acl.SiteACLConfig](#schemaacl.siteaclconfig)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": {
    "attack": {
      "action": "string",
      "block_min": 0,
      "count": 0,
      "enabled": true,
      "exclude_content_type": [
        "string"
      ],
      "period": 0,
      "status_code": [
        0
      ],
      "use_global": true
    },
    "error": {
      "action": "string",
      "block_min": 0,
      "count": 0,
      "enabled": true,
      "exclude_content_type": [
        "string"
      ],
      "period": 0,
      "status_code": [
        0
      ],
      "use_global": true
    },
    "req": {
      "action": "string",
      "block_min": 0,
      "count": 0,
      "enabled": true,
      "exclude_content_type": [
        "string"
      ],
      "period": 0,
      "status_code": [
        0
      ],
      "use_global": true
    }
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## GET get web service routing collection config

GET /open/site/{id}/excludes

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer| 是 |site id|

> 返回示例

> 200 Response

```json
{
  "data": {
    "content_types": [
      "string"
    ],
    "prefixes": [
      "string"
    ]
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## POST update web service routing collection config

POST /open/site/{id}/excludes

> Body 请求参数

```json
{
  "content_types": [
    "string"
  ],
  "prefixes": [
    "string"
  ]
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer| 是 |site id|
|body|body|[resource.UpdateExcludesReq](#schemaresource.updateexcludesreq)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## GET list web service access/error log

GET /open/site/{id}/log

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer| 是 |site id|
|type|query|string| 否 |none|

> 返回示例

> 200 Response

```json
{
  "data": [
    {
      "filename": "string",
      "size": 0
    }
  ],
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## GET get web service access/error log detail

GET /open/site/{id}/log/detail

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer| 是 |site id|
|type|query|string| 否 |none|

> 返回示例

> 200 Response

```
{}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|

### 返回数据结构

## GET download web service access/error log

GET /open/site/{id}/log/download

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer| 是 |site id|
|filename|query|string| 否 |none|

> 返回示例

> 200 Response

```
"string"
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|string|

## GET get web service access/error log limit

GET /open/site/{id}/log/limit

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer| 是 |site id|
|type|query|string| 否 |none|

> 返回示例

> 200 Response

```json
{
  "data": 0,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## POST set web service access/error log limit

POST /open/site/{id}/log/limit

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer| 是 |site id|
|limit|query|integer| 否 |none|
|type|query|string| 否 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## GET get web service tengine config

GET /open/site/{id}/nginx_config

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer| 是 |site id|

> 返回示例

> 200 Response

```json
{
  "data": {
    "config": "string",
    "custom_location": [
      "string"
    ]
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## PUT update web service tengine config

PUT /open/site/{id}/nginx_config

> Body 请求参数

```json
{
  "custom_location": [
    "string"
  ]
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer| 是 |site id|
|body|body|[site.NginxConfigUpdateReq](#schemasite.nginxconfigupdatereq)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## GET get web service security

GET /open/site/{id}/proxy

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer| 是 |site id|

> 返回示例

> 200 Response

```json
{
  "data": {
    "br": {
      "global": true,
      "value": true
    },
    "created_at": "string",
    "default_server": {
      "global": true,
      "value": true
    },
    "force_https": {
      "global": true,
      "value": true
    },
    "global_ipv6": {
      "global": true,
      "value": true
    },
    "global_ssl_ciphers": {
      "global": true,
      "value": "string"
    },
    "global_ssl_protocols": {
      "global": true,
      "value": "string"
    },
    "gzip": {
      "global": true,
      "value": true
    },
    "host": {
      "global": true,
      "value": "string"
    },
    "hsts": {
      "global": true,
      "value": true
    },
    "hsts_max_age": {
      "global": true,
      "value": "string"
    },
    "hsts_preload": {
      "global": true,
      "value": true
    },
    "hsts_sub": {
      "global": true,
      "value": true
    },
    "http2": {
      "global": true,
      "value": true
    },
    "http3": {
      "global": true,
      "value": true
    },
    "http_1.0": {
      "global": true,
      "value": true
    },
    "http_headers": {
      "global": true,
      "value": [
        {}
      ]
    },
    "id": 0,
    "ip_source": {
      "global": true,
      "value": "string"
    },
    "ip_value": {
      "global": true,
      "value": "string"
    },
    "ipv6": {
      "global": true,
      "value": true
    },
    "reset_xff": {
      "global": true,
      "value": true
    },
    "site_id": 0,
    "ssl_ciphers": {
      "global": true,
      "value": "string"
    },
    "ssl_protocols": {
      "global": null,
      "value": null
    },
    "updated_at": "string",
    "xfh": {
      "global": true,
      "value": "string"
    },
    "xfp": {
      "global": true,
      "value": "string"
    }
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## PUT set web service security

PUT /open/site/{id}/proxy

> Body 请求参数

```json
{
  "br": {
    "global": true,
    "value": true
  },
  "default_server": {
    "global": true,
    "value": true
  },
  "force_https": {
    "global": true,
    "value": true
  },
  "gzip": {
    "global": true,
    "value": true
  },
  "host": {
    "global": true,
    "value": "string"
  },
  "hsts": {
    "global": true,
    "value": true
  },
  "hsts_max_age": {
    "global": true,
    "value": "string"
  },
  "hsts_preload": {
    "global": true,
    "value": true
  },
  "hsts_sub": {
    "global": true,
    "value": true
  },
  "http2": {
    "global": true,
    "value": true
  },
  "http3": {
    "global": true,
    "value": true
  },
  "http_1.0": {
    "global": true,
    "value": true
  },
  "http_headers": {
    "global": true,
    "value": [
      {
        "key": "string",
        "op": "string",
        "target": "string",
        "val": "string"
      }
    ]
  },
  "ip_source": {
    "global": true,
    "value": "string"
  },
  "ip_value": {
    "global": true,
    "value": "string"
  },
  "ipv6": {
    "global": true,
    "value": true
  },
  "reset_xff": {
    "global": true,
    "value": true
  },
  "ssl_ciphers": {
    "global": true,
    "value": "string"
  },
  "ssl_protocols": {
    "global": true,
    "value": "string"
  },
  "xfh": {
    "global": true,
    "value": "string"
  },
  "xfp": {
    "global": true,
    "value": "string"
  }
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer| 是 |site id|
|body|body|[proxy.Config](#schemaproxy.config)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": {
    "br": {
      "global": true,
      "value": true
    },
    "created_at": "string",
    "default_server": {
      "global": true,
      "value": true
    },
    "force_https": {
      "global": true,
      "value": true
    },
    "global_ipv6": {
      "global": true,
      "value": true
    },
    "global_ssl_ciphers": {
      "global": true,
      "value": "string"
    },
    "global_ssl_protocols": {
      "global": true,
      "value": "string"
    },
    "gzip": {
      "global": true,
      "value": true
    },
    "host": {
      "global": true,
      "value": "string"
    },
    "hsts": {
      "global": true,
      "value": true
    },
    "hsts_max_age": {
      "global": true,
      "value": "string"
    },
    "hsts_preload": {
      "global": true,
      "value": true
    },
    "hsts_sub": {
      "global": true,
      "value": true
    },
    "http2": {
      "global": true,
      "value": true
    },
    "http3": {
      "global": true,
      "value": true
    },
    "http_1.0": {
      "global": true,
      "value": true
    },
    "http_headers": {
      "global": true,
      "value": [
        {}
      ]
    },
    "id": 0,
    "ip_source": {
      "global": true,
      "value": "string"
    },
    "ip_value": {
      "global": true,
      "value": "string"
    },
    "ipv6": {
      "global": true,
      "value": true
    },
    "reset_xff": {
      "global": true,
      "value": true
    },
    "site_id": 0,
    "ssl_ciphers": {
      "global": true,
      "value": "string"
    },
    "ssl_protocols": {
      "global": null,
      "value": null
    },
    "updated_at": "string",
    "xfh": {
      "global": true,
      "value": "string"
    },
    "xfp": {
      "global": true,
      "value": "string"
    }
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## GET list web service routing

GET /open/site/{id}/resources

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer| 是 |site id|

> 返回示例

> 200 Response

```json
{
  "data": {
    "nodes": [
      {
        "content_length": 0,
        "content_type": "string",
        "created_at": "string",
        "id": 0,
        "method": "string",
        "path": "string",
        "req_header": "string",
        "req_today": 0,
        "response_time": 0,
        "site_id": 0,
        "status_code": 0,
        "updated_at": "string"
      }
    ],
    "total": 0
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## DELETE delete web service routing

DELETE /open/site/{id}/resources

> Body 请求参数

```json
{
  "ids": [
    0
  ]
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer| 是 |site id|
|body|body|[resource.RemoveReq](#schemaresource.removereq)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## GET get web service static file

GET /open/site/{id}/static

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer| 是 |site id|
|path|query|string| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": [
    {
      "content": "string",
      "content_type": "string",
      "dir": true,
      "modify_time": 0,
      "name": "string",
      "size": 0
    }
  ],
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## PUT rename web service static file

PUT /open/site/{id}/static

> Body 请求参数

```json
{
  "copy": true,
  "new_path": "string",
  "old_path": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer| 是 |site id|
|body|body|[site.RenameStaticReq](#schemasite.renamestaticreq)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## POST create web service static file

POST /open/site/{id}/static

> Body 请求参数

```json
{
  "dir": true,
  "page": "string",
  "path": "string",
  "zip": true
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer| 是 |site id|
|body|body|[site.AddStaticReq](#schemasite.addstaticreq)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## DELETE delete web service static file

DELETE /open/site/{id}/static

> Body 请求参数

```json
{
  "path": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer| 是 |site id|
|body|body|[site.DeleteStaticReq](#schemasite.deletestaticreq)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

# dynamic

## GET get site dynamic

GET /open/site/{id}/chaos

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer| 是 |site id|

> 返回示例

> 200 Response

```json
{
  "data": {
    "created_at": "string",
    "html_encryption": true,
    "html_fast_decryption": true,
    "id": 0,
    "img_encryption": true,
    "img_text": "string",
    "img_watermark": "string",
    "is_enabled": true,
    "js_encryption": true,
    "js_path": [
      "string"
    ],
    "name": "string",
    "updated_at": "string",
    "website_id": 0
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

## POST create site dynamic

POST /open/site/{id}/chaos

> Body 请求参数

```json
{
  "html_encryption": true,
  "html_fast_decryption": true,
  "img_encryption": true,
  "img_text": "string",
  "img_watermark": "string",
  "is_enabled": true,
  "js_encryption": true,
  "js_path": [
    "string"
  ]
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer| 是 |site id|
|body|body|[site.WebsiteChaosReq](#schemasite.websitechaosreq)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

# license

## GET get license

GET /open/system/authorize

> 返回示例

> 200 Response

```json
{
  "data": {
    "expired_at": 0,
    "org_id": "string",
    "org_name": "string",
    "purchased": true,
    "pwd_updated_at": 0,
    "river_url": "string",
    "role": 0,
    "state": "string",
    "timeout": true,
    "user_id": 0,
    "version": 0
  },
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

#### 枚举值

|属性|值|
|---|---|
|role|0|
|role|1|
|role|2|
|role|3|
|role|4|
|role|5|
|version|0|
|version|1|
|version|2|

## PUT reapply license

PUT /open/system/authorize

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## POST apply license

POST /open/system/authorize

> Body 请求参数

```json
{
  "code": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|[system.CodeApplyReq](#schemasystem.codeapplyreq)| 是 |none|

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

## DELETE delete license

DELETE /open/system/authorize

> 返回示例

> 200 Response

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[response.JSONBody](#schemaresponse.jsonbody)|

# 数据模型

<h2 id="tocS_acl.Config">acl.Config</h2>

<a id="schemaacl.config"></a>
<a id="schema_acl.Config"></a>
<a id="tocSacl.config"></a>
<a id="tocsacl.config"></a>

```json
{
  "action": "string",
  "block_min": 0,
  "count": 0,
  "enabled": true,
  "exclude_content_type": [
    "string"
  ],
  "period": 0,
  "status_code": [
    0
  ],
  "use_global": true
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|action|string|false|none||none|
|block_min|integer|false|none||none|
|count|integer|false|none||none|
|enabled|boolean|false|none||none|
|exclude_content_type|[string]|false|none||none|
|period|integer|false|none||none|
|status_code|[integer]|false|none||none|
|use_global|boolean|false|none||none|

<h2 id="tocS_acl.GetACLLogsRes">acl.GetACLLogsRes</h2>

<a id="schemaacl.getacllogsres"></a>
<a id="schema_acl.GetACLLogsRes"></a>
<a id="tocSacl.getacllogsres"></a>
<a id="tocsacl.getacllogsres"></a>

```json
{
  "data": [
    {
      "action": "ban",
      "block_min": 0,
      "city": "string",
      "count": 0,
      "country": "string",
      "created_at": "string",
      "denied_count": 0,
      "id": 0,
      "ip": "string",
      "period": 0,
      "province": "string",
      "reason": "req",
      "result": "string",
      "site_comment": "string",
      "site_icon": "string",
      "site_id": 0,
      "site_server_names": [
        "string"
      ],
      "site_title": "string",
      "status": 0,
      "updated_at": "string",
      "valid_before": "string"
    }
  ],
  "total": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|data|[[acl.Log](#schemaacl.log)]|false|none||none|
|total|integer|false|none||none|

<h2 id="tocS_acl.Log">acl.Log</h2>

<a id="schemaacl.log"></a>
<a id="schema_acl.Log"></a>
<a id="tocSacl.log"></a>
<a id="tocsacl.log"></a>

```json
{
  "action": "ban",
  "block_min": 0,
  "city": "string",
  "count": 0,
  "country": "string",
  "created_at": "string",
  "denied_count": 0,
  "id": 0,
  "ip": "string",
  "period": 0,
  "province": "string",
  "reason": "req",
  "result": "string",
  "site_comment": "string",
  "site_icon": "string",
  "site_id": 0,
  "site_server_names": [
    "string"
  ],
  "site_title": "string",
  "status": 0,
  "updated_at": "string",
  "valid_before": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|action|[model.ACLConfigAction](#schemamodel.aclconfigaction)|false|none||none|
|block_min|integer|false|none||none|
|city|string|false|none||obsolete|
|count|integer|false|none||none|
|country|string|false|none||obsolete|
|created_at|string|false|none||none|
|denied_count|integer|false|none||none|
|id|integer|false|none||none|
|ip|string|false|none||none|
|period|integer|false|none||none|
|province|string|false|none||obsolete|
|reason|[model.ACLConfigType](#schemamodel.aclconfigtype)|false|none||none|
|result|string|false|none||none|
|site_comment|string|false|none||none|
|site_icon|string|false|none||none|
|site_id|integer|false|none||none|
|site_server_names|[string]|false|none||none|
|site_title|string|false|none||none|
|status|integer|false|none||none|
|updated_at|string|false|none||none|
|valid_before|string|false|none||none|

<h2 id="tocS_acl.SiteACLConfig">acl.SiteACLConfig</h2>

<a id="schemaacl.siteaclconfig"></a>
<a id="schema_acl.SiteACLConfig"></a>
<a id="tocSacl.siteaclconfig"></a>
<a id="tocsacl.siteaclconfig"></a>

```json
{
  "attack": {
    "action": "string",
    "block_min": 0,
    "count": 0,
    "enabled": true,
    "exclude_content_type": [
      "string"
    ],
    "period": 0,
    "status_code": [
      0
    ],
    "use_global": true
  },
  "error": {
    "action": "string",
    "block_min": 0,
    "count": 0,
    "enabled": true,
    "exclude_content_type": [
      "string"
    ],
    "period": 0,
    "status_code": [
      0
    ],
    "use_global": true
  },
  "req": {
    "action": "string",
    "block_min": 0,
    "count": 0,
    "enabled": true,
    "exclude_content_type": [
      "string"
    ],
    "period": 0,
    "status_code": [
      0
    ],
    "use_global": true
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|attack|[acl.Config](#schemaacl.config)|false|none||none|
|error|[acl.Config](#schemaacl.config)|false|none||none|
|req|[acl.Config](#schemaacl.config)|false|none||none|

<h2 id="tocS_api.ACLRelieveRequest">api.ACLRelieveRequest</h2>

<a id="schemaapi.aclrelieverequest"></a>
<a id="schema_api.ACLRelieveRequest"></a>
<a id="tocSapi.aclrelieverequest"></a>
<a id="tocsapi.aclrelieverequest"></a>

```json
{
  "id": 0,
  "ip": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer|false|none||none|
|ip|string|false|none||none|

<h2 id="tocS_api.ChallengeLog">api.ChallengeLog</h2>

<a id="schemaapi.challengelog"></a>
<a id="schema_api.ChallengeLog"></a>
<a id="tocSapi.challengelog"></a>
<a id="tocsapi.challengelog"></a>

```json
{
  "city": "string",
  "country": "string",
  "created_at": "string",
  "dur_sec": 0,
  "ended_at": 0,
  "event_id": "string",
  "id": 0,
  "ip": "string",
  "pass_count": 0,
  "province": "string",
  "rule_id": 0,
  "site_comment": "string",
  "site_icon": "string",
  "site_id": 0,
  "site_server_names": [
    "string"
  ],
  "site_title": "string",
  "started_at": 0,
  "trigger_count": 0,
  "updated_at": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|city|string|false|none||none|
|country|string|false|none||none|
|created_at|string|false|none||none|
|dur_sec|integer|false|none||none|
|ended_at|integer|false|none||none|
|event_id|string|false|none||none|
|id|integer|false|none||none|
|ip|string|false|none||none|
|pass_count|integer|false|none||none|
|province|string|false|none||none|
|rule_id|integer|false|none||none|
|site_comment|string|false|none||none|
|site_icon|string|false|none||none|
|site_id|integer|false|none||none|
|site_server_names|[string]|false|none||none|
|site_title|string|false|none||none|
|started_at|integer|false|none||none|
|trigger_count|integer|false|none||none|
|updated_at|string|false|none||none|

<h2 id="tocS_api.DashboardTrendRes">api.DashboardTrendRes</h2>

<a id="schemaapi.dashboardtrendres"></a>
<a id="schema_api.DashboardTrendRes"></a>
<a id="tocSapi.dashboardtrendres"></a>
<a id="tocsapi.dashboardtrendres"></a>

```json
{
  "nodes": [
    {
      "label": "string",
      "value": 0
    }
  ],
  "total": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|nodes|[[api.Node](#schemaapi.node)]|false|none||none|
|total|integer|false|none||none|

<h2 id="tocS_api.DeleteIPGroupReq">api.DeleteIPGroupReq</h2>

<a id="schemaapi.deleteipgroupreq"></a>
<a id="schema_api.DeleteIPGroupReq"></a>
<a id="tocSapi.deleteipgroupreq"></a>
<a id="tocsapi.deleteipgroupreq"></a>

```json
{
  "ids": [
    0
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|ids|[integer]|false|none||none|

<h2 id="tocS_api.GetCertListRes">api.GetCertListRes</h2>

<a id="schemaapi.getcertlistres"></a>
<a id="schema_api.GetCertListRes"></a>
<a id="tocSapi.getcertlistres"></a>
<a id="tocsapi.getcertlistres"></a>

```json
{
  "nodes": [
    {
      "acme_message": "string",
      "domains": [
        "string"
      ],
      "expired": true,
      "id": 0,
      "issuer": "string",
      "related_sites": [
        "string"
      ],
      "revoked": true,
      "self_signature": true,
      "trusted": true,
      "type": 0,
      "valid_before": "string"
    }
  ],
  "total": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|nodes|[[api.ListCertItem](#schemaapi.listcertitem)]|false|none||none|
|total|integer|false|none||none|

<h2 id="tocS_api.GetChallengeLogsRes">api.GetChallengeLogsRes</h2>

<a id="schemaapi.getchallengelogsres"></a>
<a id="schema_api.GetChallengeLogsRes"></a>
<a id="tocSapi.getchallengelogsres"></a>
<a id="tocsapi.getchallengelogsres"></a>

```json
{
  "data": [
    {
      "city": "string",
      "country": "string",
      "created_at": "string",
      "dur_sec": 0,
      "ended_at": 0,
      "event_id": "string",
      "id": 0,
      "ip": "string",
      "pass_count": 0,
      "province": "string",
      "rule_id": 0,
      "site_comment": "string",
      "site_icon": "string",
      "site_id": 0,
      "site_server_names": [
        "string"
      ],
      "site_title": "string",
      "started_at": 0,
      "trigger_count": 0,
      "updated_at": "string"
    }
  ],
  "total": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|data|[[api.ChallengeLog](#schemaapi.challengelog)]|false|none||none|
|total|integer|false|none||none|

<h2 id="tocS_api.GetDashboardUserCountsReq">api.GetDashboardUserCountsReq</h2>

<a id="schemaapi.getdashboardusercountsreq"></a>
<a id="schema_api.GetDashboardUserCountsReq"></a>
<a id="tocSapi.getdashboardusercountsreq"></a>
<a id="tocsapi.getdashboardusercountsreq"></a>

```json
{
  "ip": [
    {
      "label": "string",
      "value": 0
    }
  ],
  "pv": [
    {
      "label": "string",
      "value": 0
    }
  ],
  "today_ip": 0,
  "today_pv": 0,
  "today_uv": 0,
  "uv": [
    {
      "label": "string",
      "value": 0
    }
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|ip|[[api.Node](#schemaapi.node)]|false|none||none|
|pv|[[api.Node](#schemaapi.node)]|false|none||none|
|today_ip|integer|false|none||none|
|today_pv|integer|false|none||none|
|today_uv|integer|false|none||none|
|uv|[[api.Node](#schemaapi.node)]|false|none||none|

<h2 id="tocS_api.GetDetectorRes">api.GetDetectorRes</h2>

<a id="schemaapi.getdetectorres"></a>
<a id="schema_api.GetDetectorRes"></a>
<a id="tocSapi.getdetectorres"></a>
<a id="tocsapi.getdetectorres"></a>

```json
{
  "mode": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|mode|integer|false|none||none|

<h2 id="tocS_api.GetDowngradeVersionRes">api.GetDowngradeVersionRes</h2>

<a id="schemaapi.getdowngradeversionres"></a>
<a id="schema_api.GetDowngradeVersionRes"></a>
<a id="tocSapi.getdowngradeversionres"></a>
<a id="tocsapi.getdowngradeversionres"></a>

```json
{
  "status": true
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|status|boolean|false|none||none|

<h2 id="tocS_api.GetGlobalModeConfigRes">api.GetGlobalModeConfigRes</h2>

<a id="schemaapi.getglobalmodeconfigres"></a>
<a id="schema_api.GetGlobalModeConfigRes"></a>
<a id="tocSapi.getglobalmodeconfigres"></a>
<a id="tocsapi.getglobalmodeconfigres"></a>

```json
{
  "semantics": {
    "property1": "string",
    "property2": "string"
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|semantics|[model.PolicyGroup](#schemamodel.policygroup)|false|none||none|

<h2 id="tocS_api.GetIPGroupByLinkRes">api.GetIPGroupByLinkRes</h2>

<a id="schemaapi.getipgroupbylinkres"></a>
<a id="schema_api.GetIPGroupByLinkRes"></a>
<a id="tocSapi.getipgroupbylinkres"></a>
<a id="tocsapi.getipgroupbylinkres"></a>

```json
{
  "ips": [
    "string"
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|ips|[string]|false|none||none|

<h2 id="tocS_api.GetIPGroupDetailRes">api.GetIPGroupDetailRes</h2>

<a id="schemaapi.getipgroupdetailres"></a>
<a id="schema_api.GetIPGroupDetailRes"></a>
<a id="tocSapi.getipgroupdetailres"></a>
<a id="tocsapi.getipgroupdetailres"></a>

```json
{
  "data": {
    "builtin": true,
    "comment": "string",
    "id": 0,
    "ips": [
      "string"
    ],
    "reference": "string",
    "total": 0,
    "updated_at": "string"
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|data|[ipg.IPGroupVO](#schemaipg.ipgroupvo)|false|none||none|

<h2 id="tocS_api.GetIPGroupRes">api.GetIPGroupRes</h2>

<a id="schemaapi.getipgroupres"></a>
<a id="schema_api.GetIPGroupRes"></a>
<a id="tocSapi.getipgroupres"></a>
<a id="tocsapi.getipgroupres"></a>

```json
{
  "nodes": [
    {
      "builtin": true,
      "comment": "string",
      "id": 0,
      "ips": [
        "string"
      ],
      "reference": "string",
      "total": 0,
      "updated_at": "string"
    }
  ],
  "total": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|nodes|[[ipg.IPGroupVO](#schemaipg.ipgroupvo)]|false|none||none|
|total|integer|false|none||none|

<h2 id="tocS_api.GetManagerInfoRes">api.GetManagerInfoRes</h2>

<a id="schemaapi.getmanagerinfores"></a>
<a id="schema_api.GetManagerInfoRes"></a>
<a id="tocSapi.getmanagerinfores"></a>
<a id="tocsapi.getmanagerinfores"></a>

```json
{
  "data": {
    "common_color": {
      "font_color": "string",
      "light_font_color": "string",
      "light_primary_color": "string",
      "primary_color": "string",
      "success_color": "string"
    },
    "error_color": {
      "warning_color": "string",
      "warning_font_color": "string",
      "warning_light_font_color": "string"
    },
    "manager_info": "string",
    "page_manager_info": {
      "property1": "string",
      "property2": "string"
    }
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|data|[model.ManagerInfo](#schemamodel.managerinfo)|false|none||none|

<h2 id="tocS_api.GetSkynetRuleRes">api.GetSkynetRuleRes</h2>

<a id="schemaapi.getskynetruleres"></a>
<a id="schema_api.GetSkynetRuleRes"></a>
<a id="tocSapi.getskynetruleres"></a>
<a id="tocsapi.getskynetruleres"></a>

```json
{
  "rules": {
    "property1": {
      "attack_type": 0,
      "id": "string",
      "mode": "string",
      "name": "string",
      "risk_level": 0
    },
    "property2": {
      "attack_type": 0,
      "id": "string",
      "mode": "string",
      "name": "string",
      "risk_level": 0
    }
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|rules|object|false|none||none|
|» **additionalProperties**|[detect.SkynetInfo](#schemadetect.skynetinfo)|false|none||none|

<h2 id="tocS_api.GetSpecialPageRes">api.GetSpecialPageRes</h2>

<a id="schemaapi.getspecialpageres"></a>
<a id="schema_api.GetSpecialPageRes"></a>
<a id="tocSapi.getspecialpageres"></a>
<a id="tocsapi.getspecialpageres"></a>

```json
{
  "content": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|content|string|false|none||none|

<h2 id="tocS_api.GlobalModeConfigParams">api.GlobalModeConfigParams</h2>

<a id="schemaapi.globalmodeconfigparams"></a>
<a id="schema_api.GlobalModeConfigParams"></a>
<a id="tocSapi.globalmodeconfigparams"></a>
<a id="tocsapi.globalmodeconfigparams"></a>

```json
{
  "semantics": {
    "property1": "string",
    "property2": "string"
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|semantics|[model.PolicyGroup](#schemamodel.policygroup)|true|none||none|

<h2 id="tocS_api.ListCertItem">api.ListCertItem</h2>

<a id="schemaapi.listcertitem"></a>
<a id="schema_api.ListCertItem"></a>
<a id="tocSapi.listcertitem"></a>
<a id="tocsapi.listcertitem"></a>

```json
{
  "acme_message": "string",
  "domains": [
    "string"
  ],
  "expired": true,
  "id": 0,
  "issuer": "string",
  "related_sites": [
    "string"
  ],
  "revoked": true,
  "self_signature": true,
  "trusted": true,
  "type": 0,
  "valid_before": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|acme_message|string|false|none||none|
|domains|[string]|false|none||none|
|expired|boolean|false|none||none|
|id|integer|false|none||none|
|issuer|string|false|none||none|
|related_sites|[string]|false|none||none|
|revoked|boolean|false|none||none|
|self_signature|boolean|false|none||none|
|trusted|boolean|false|none||none|
|type|integer|false|none||none|
|valid_before|string|false|none||none|

<h2 id="tocS_api.ListSpecialPageItem">api.ListSpecialPageItem</h2>

<a id="schemaapi.listspecialpageitem"></a>
<a id="schema_api.ListSpecialPageItem"></a>
<a id="tocSapi.listspecialpageitem"></a>
<a id="tocsapi.listspecialpageitem"></a>

```json
{
  "custom": true,
  "type": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|custom|boolean|false|none||none|
|type|string|false|none||none|

<h2 id="tocS_api.LogMaxDayConfig">api.LogMaxDayConfig</h2>

<a id="schemaapi.logmaxdayconfig"></a>
<a id="schema_api.LogMaxDayConfig"></a>
<a id="tocSapi.logmaxdayconfig"></a>
<a id="tocsapi.logmaxdayconfig"></a>

```json
{
  "max_day": 0,
  "max_stat_day": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|max_day|integer|false|none||none|
|max_stat_day|integer|false|none||none|

<h2 id="tocS_api.Node">api.Node</h2>

<a id="schemaapi.node"></a>
<a id="schema_api.Node"></a>
<a id="tocSapi.node"></a>
<a id="tocsapi.node"></a>

```json
{
  "label": "string",
  "value": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|label|string|false|none||none|
|value|integer|false|none||none|

<h2 id="tocS_api.PostAppendIPGroupRequest">api.PostAppendIPGroupRequest</h2>

<a id="schemaapi.postappendipgrouprequest"></a>
<a id="schema_api.PostAppendIPGroupRequest"></a>
<a id="tocSapi.postappendipgrouprequest"></a>
<a id="tocsapi.postappendipgrouprequest"></a>

```json
{
  "ip_group_ids": [
    0
  ],
  "ips": [
    "string"
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|ip_group_ids|[integer]|false|none||none|
|ips|[string]|false|none||none|

<h2 id="tocS_api.PostDetectorReq">api.PostDetectorReq</h2>

<a id="schemaapi.postdetectorreq"></a>
<a id="schema_api.PostDetectorReq"></a>
<a id="tocSapi.postdetectorreq"></a>
<a id="tocsapi.postdetectorreq"></a>

```json
{
  "mode": 0,
  "ts": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|mode|integer|false|none||none|
|ts|integer|false|none||none|

<h2 id="tocS_api.PutManagerInfoReq">api.PutManagerInfoReq</h2>

<a id="schemaapi.putmanagerinforeq"></a>
<a id="schema_api.PutManagerInfoReq"></a>
<a id="tocSapi.putmanagerinforeq"></a>
<a id="tocsapi.putmanagerinforeq"></a>

```json
{
  "common_color": {
    "font_color": "string",
    "light_font_color": "string",
    "light_primary_color": "string",
    "primary_color": "string",
    "success_color": "string"
  },
  "error_color": {
    "warning_color": "string",
    "warning_font_color": "string",
    "warning_light_font_color": "string"
  },
  "manager_info": "string",
  "page_manager_info": {
    "property1": "string",
    "property2": "string"
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|common_color|[model.CommonColor](#schemamodel.commoncolor)|false|none||none|
|error_color|[model.ErrorColor](#schemamodel.errorcolor)|false|none||none|
|manager_info|string|false|none||none|
|page_manager_info|object|false|none||none|
|» **additionalProperties**|string|false|none||none|

<h2 id="tocS_api.PutSkynetRuleReq">api.PutSkynetRuleReq</h2>

<a id="schemaapi.putskynetrulereq"></a>
<a id="schema_api.PutSkynetRuleReq"></a>
<a id="tocSapi.putskynetrulereq"></a>
<a id="tocsapi.putskynetrulereq"></a>

```json
{
  "global": true,
  "id": "string",
  "mode": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|global|boolean|false|none||none|
|id|string|false|none||none|
|mode|string|false|none||none|

<h2 id="tocS_api.PutSkynetRuleSwitchReq">api.PutSkynetRuleSwitchReq</h2>

<a id="schemaapi.putskynetruleswitchreq"></a>
<a id="schema_api.PutSkynetRuleSwitchReq"></a>
<a id="tocSapi.putskynetruleswitchreq"></a>
<a id="tocsapi.putskynetruleswitchreq"></a>

```json
{
  "enable": true
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|enable|boolean|false|none||none|

<h2 id="tocS_api.PutSpecialPageRequest">api.PutSpecialPageRequest</h2>

<a id="schemaapi.putspecialpagerequest"></a>
<a id="schema_api.PutSpecialPageRequest"></a>
<a id="tocSapi.putspecialpagerequest"></a>
<a id="tocsapi.putspecialpagerequest"></a>

```json
{
  "recover": true,
  "response_html": "string",
  "type": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|recover|boolean|false|none||none|
|response_html|string|false|none||none|
|type|string|false|none||none|

<h2 id="tocS_api.PutThreatInfoRequest">api.PutThreatInfoRequest</h2>

<a id="schemaapi.putthreatinforequest"></a>
<a id="schema_api.PutThreatInfoRequest"></a>
<a id="tocSapi.putthreatinforequest"></a>
<a id="tocsapi.putthreatinforequest"></a>

```json
{
  "share_enabled": true
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|share_enabled|boolean|false|none||none|

<h2 id="tocS_api.PutThreatLibRequest">api.PutThreatLibRequest</h2>

<a id="schemaapi.putthreatlibrequest"></a>
<a id="schema_api.PutThreatLibRequest"></a>
<a id="tocSapi.putthreatlibrequest"></a>
<a id="tocsapi.putthreatlibrequest"></a>

```json
{
  "use_commercial_lib": true
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|use_commercial_lib|boolean|false|none||是否使用商业 IP 库|

<h2 id="tocS_api.QpsRes">api.QpsRes</h2>

<a id="schemaapi.qpsres"></a>
<a id="schema_api.QpsRes"></a>
<a id="tocSapi.qpsres"></a>
<a id="tocsapi.qpsres"></a>

```json
{
  "nodes": [
    {
      "property1": null,
      "property2": null
    }
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|nodes|[object]|false|none||none|
|» **additionalProperties**|any|false|none||none|

<h2 id="tocS_api.SetShareBehaviourRequest">api.SetShareBehaviourRequest</h2>

<a id="schemaapi.setsharebehaviourrequest"></a>
<a id="schema_api.SetShareBehaviourRequest"></a>
<a id="tocSapi.setsharebehaviourrequest"></a>
<a id="tocsapi.setsharebehaviourrequest"></a>

```json
{
  "enable": true
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|enable|boolean|false|none||none|

<h2 id="tocS_api.SetShareFingerprintRequest">api.SetShareFingerprintRequest</h2>

<a id="schemaapi.setsharefingerprintrequest"></a>
<a id="schema_api.SetShareFingerprintRequest"></a>
<a id="tocSapi.setsharefingerprintrequest"></a>
<a id="tocsapi.setsharefingerprintrequest"></a>

```json
{
  "enable": true
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|enable|boolean|false|none||none|

<h2 id="tocS_api.TestWebHookConfig">api.TestWebHookConfig</h2>

<a id="schemaapi.testwebhookconfig"></a>
<a id="schema_api.TestWebHookConfig"></a>
<a id="tocSapi.testwebhookconfig"></a>
<a id="tocsapi.testwebhookconfig"></a>

```json
{
  "type": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|type|string|false|none||none|

<h2 id="tocS_audit_log.ListAuditLogItem">audit_log.ListAuditLogItem</h2>

<a id="schemaaudit_log.listauditlogitem"></a>
<a id="schema_audit_log.ListAuditLogItem"></a>
<a id="tocSaudit_log.listauditlogitem"></a>
<a id="tocsaudit_log.listauditlogitem"></a>

```json
{
  "content": "string",
  "created_at": 0,
  "id": 0,
  "ip": "string",
  "username": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|content|string|false|none||none|
|created_at|integer|false|none||none|
|id|integer|false|none||none|
|ip|string|false|none||none|
|username|string|false|none||none|

<h2 id="tocS_audit_log.ListAuditLogRes">audit_log.ListAuditLogRes</h2>

<a id="schemaaudit_log.listauditlogres"></a>
<a id="schema_audit_log.ListAuditLogRes"></a>
<a id="tocSaudit_log.listauditlogres"></a>
<a id="tocsaudit_log.listauditlogres"></a>

```json
{
  "data": [
    {
      "content": "string",
      "created_at": 0,
      "id": 0,
      "ip": "string",
      "username": "string"
    }
  ],
  "total": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|data|[[audit_log.ListAuditLogItem](#schemaaudit_log.listauditlogitem)]|false|none||none|
|total|integer|false|none||none|

<h2 id="tocS_auth.GetCsrfTokenRes">auth.GetCsrfTokenRes</h2>

<a id="schemaauth.getcsrftokenres"></a>
<a id="schema_auth.GetCsrfTokenRes"></a>
<a id="tocSauth.getcsrftokenres"></a>
<a id="tocsauth.getcsrftokenres"></a>

```json
{
  "csrf_token": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|csrf_token|string|false|none||none|

<h2 id="tocS_auth.LoginReq">auth.LoginReq</h2>

<a id="schemaauth.loginreq"></a>
<a id="schema_auth.LoginReq"></a>
<a id="tocSauth.loginreq"></a>
<a id="tocsauth.loginreq"></a>

```json
{
  "csrf_token": "string",
  "password": "string",
  "username": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|csrf_token|string|false|none||none|
|password|string|false|none||none|
|username|string|false|none||none|

<h2 id="tocS_auth.LoginRes">auth.LoginRes</h2>

<a id="schemaauth.loginres"></a>
<a id="schema_auth.LoginRes"></a>
<a id="tocSauth.loginres"></a>
<a id="tocsauth.loginres"></a>

```json
{
  "id": 0,
  "jwt": "string",
  "tfa_bind_url": "string",
  "tfa_binded": true,
  "tfa_enabled": true
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer|false|none||none|
|jwt|string|false|none||none|
|tfa_bind_url|string|false|none||none|
|tfa_binded|boolean|false|none||none|
|tfa_enabled|boolean|false|none||none|

<h2 id="tocS_auth.TfaReq">auth.TfaReq</h2>

<a id="schemaauth.tfareq"></a>
<a id="schema_auth.TfaReq"></a>
<a id="tocSauth.tfareq"></a>
<a id="tocsauth.tfareq"></a>

```json
{
  "code": "string",
  "csrf_token": "string",
  "timestamp": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|string|false|none||none|
|csrf_token|string|false|none||none|
|timestamp|integer|false|none||none|

<h2 id="tocS_auth.TfaRes">auth.TfaRes</h2>

<a id="schemaauth.tfares"></a>
<a id="schema_auth.TfaRes"></a>
<a id="tocSauth.tfares"></a>
<a id="tocsauth.tfares"></a>

```json
{
  "jwt": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|jwt|string|false|none||none|

<h2 id="tocS_auth_defense.CreateSourceReq">auth_defense.CreateSourceReq</h2>

<a id="schemaauth_defense.createsourcereq"></a>
<a id="schema_auth_defense.CreateSourceReq"></a>
<a id="tocSauth_defense.createsourcereq"></a>
<a id="tocsauth_defense.createsourcereq"></a>

```json
{
  "auth": {
    "oauth2": {
      "app_id": "string",
      "app_secret": "string"
    }
  },
  "comment": "string",
  "type": 0,
  "user": [
    {
      "password": "string",
      "username": "string"
    }
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|auth|[model.PolicyAuth](#schemamodel.policyauth)|false|none||none|
|comment|string|true|none||none|
|type|[model.AuthDefenseSourceType](#schemamodel.authdefensesourcetype)|false|none||none|
|user|[[model.PolicyUser](#schemamodel.policyuser)]|false|none||none|

<h2 id="tocS_auth_defense.GetAuthDefenseLogsRes">auth_defense.GetAuthDefenseLogsRes</h2>

<a id="schemaauth_defense.getauthdefenselogsres"></a>
<a id="schema_auth_defense.GetAuthDefenseLogsRes"></a>
<a id="tocSauth_defense.getauthdefenselogsres"></a>
<a id="tocsauth_defense.getauthdefenselogsres"></a>

```json
{
  "data": [
    {
      "city": "string",
      "country": "string",
      "created_at": "string",
      "deny_count": 0,
      "dur_sec": 0,
      "ended_at": 0,
      "event_id": "string",
      "id": 0,
      "ip": "string",
      "pass_count": 0,
      "province": "string",
      "rule_id": 0,
      "site_comment": "string",
      "site_icon": "string",
      "site_id": 0,
      "site_server_names": [
        "string"
      ],
      "site_title": "string",
      "started_at": 0,
      "trigger_count": 0,
      "updated_at": "string",
      "username": "string"
    }
  ],
  "total": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|data|[[auth_defense.Log](#schemaauth_defense.log)]|false|none||none|
|total|integer|false|none||none|

<h2 id="tocS_auth_defense.GetAuthDefenseLogsV2Item">auth_defense.GetAuthDefenseLogsV2Item</h2>

<a id="schemaauth_defense.getauthdefenselogsv2item"></a>
<a id="schema_auth_defense.GetAuthDefenseLogsV2Item"></a>
<a id="tocSauth_defense.getauthdefenselogsv2item"></a>
<a id="tocsauth_defense.getauthdefenselogsv2item"></a>

```json
{
  "auth_source_id": 0,
  "city": "string",
  "country": "string",
  "created_at": "string",
  "id": 0,
  "ip": "string",
  "policy_id": 0,
  "province": "string",
  "result": true,
  "site_comment": "string",
  "site_icon": "string",
  "site_id": 0,
  "site_server_names": [
    "string"
  ],
  "site_title": "string",
  "source_type": 0,
  "updated_at": "string",
  "username": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|auth_source_id|integer|false|none||none|
|city|string|false|none||none|
|country|string|false|none||none|
|created_at|string|false|none||none|
|id|integer|false|none||none|
|ip|string|false|none||none|
|policy_id|integer|false|none||none|
|province|string|false|none||none|
|result|boolean|false|none||none|
|site_comment|string|false|none||none|
|site_icon|string|false|none||none|
|site_id|integer|false|none||none|
|site_server_names|[string]|false|none||none|
|site_title|string|false|none||none|
|source_type|[model.AuthDefenseSourceType](#schemamodel.authdefensesourcetype)|false|none||none|
|updated_at|string|false|none||none|
|username|string|false|none||none|

<h2 id="tocS_auth_defense.GetAuthDefenseLogsV2Res">auth_defense.GetAuthDefenseLogsV2Res</h2>

<a id="schemaauth_defense.getauthdefenselogsv2res"></a>
<a id="schema_auth_defense.GetAuthDefenseLogsV2Res"></a>
<a id="tocSauth_defense.getauthdefenselogsv2res"></a>
<a id="tocsauth_defense.getauthdefenselogsv2res"></a>

```json
{
  "data": [
    {
      "auth_source_id": 0,
      "city": "string",
      "country": "string",
      "created_at": "string",
      "id": 0,
      "ip": "string",
      "policy_id": 0,
      "province": "string",
      "result": true,
      "site_comment": "string",
      "site_icon": "string",
      "site_id": 0,
      "site_server_names": [
        "string"
      ],
      "site_title": "string",
      "source_type": 0,
      "updated_at": "string",
      "username": "string"
    }
  ],
  "total": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|data|[[auth_defense.GetAuthDefenseLogsV2Item](#schemaauth_defense.getauthdefenselogsv2item)]|false|none||none|
|total|integer|false|none||none|

<h2 id="tocS_auth_defense.ListGroupItem">auth_defense.ListGroupItem</h2>

<a id="schemaauth_defense.listgroupitem"></a>
<a id="schema_auth_defense.ListGroupItem"></a>
<a id="tocSauth_defense.listgroupitem"></a>
<a id="tocsauth_defense.listgroupitem"></a>

```json
{
  "comment": "string",
  "id": 0,
  "related_sites": [
    "string"
  ],
  "total_user": 0,
  "type": 0,
  "valid_user": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|comment|string|false|none||none|
|id|integer|false|none||none|
|related_sites|[string]|false|none||none|
|total_user|integer|false|none||none|
|type|[model.AuthDefenseSourceType](#schemamodel.authdefensesourcetype)|false|none||none|
|valid_user|integer|false|none||none|

<h2 id="tocS_auth_defense.ListGroupRes">auth_defense.ListGroupRes</h2>

<a id="schemaauth_defense.listgroupres"></a>
<a id="schema_auth_defense.ListGroupRes"></a>
<a id="tocSauth_defense.listgroupres"></a>
<a id="tocsauth_defense.listgroupres"></a>

```json
{
  "data": [
    {
      "comment": "string",
      "id": 0,
      "related_sites": [
        "string"
      ],
      "total_user": 0,
      "type": 0,
      "valid_user": 0
    }
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|data|[[auth_defense.ListGroupItem](#schemaauth_defense.listgroupitem)]|false|none||none|

<h2 id="tocS_auth_defense.ListSourceUserItem">auth_defense.ListSourceUserItem</h2>

<a id="schemaauth_defense.listsourceuseritem"></a>
<a id="schema_auth_defense.ListSourceUserItem"></a>
<a id="tocSauth_defense.listsourceuseritem"></a>
<a id="tocsauth_defense.listsourceuseritem"></a>

```json
{
  "id": 0,
  "last_login": 0,
  "status": 0,
  "uname": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer|false|none||none|
|last_login|integer|false|none||none|
|status|[model.AuthDefenseSourceUserStatus](#schemamodel.authdefensesourceuserstatus)|false|none||none|
|uname|string|false|none||none|

<h2 id="tocS_auth_defense.ListSourceUserRes">auth_defense.ListSourceUserRes</h2>

<a id="schemaauth_defense.listsourceuserres"></a>
<a id="schema_auth_defense.ListSourceUserRes"></a>
<a id="tocSauth_defense.listsourceuserres"></a>
<a id="tocsauth_defense.listsourceuserres"></a>

```json
{
  "approved_total": 0,
  "data": [
    {
      "id": 0,
      "last_login": 0,
      "status": 0,
      "uname": "string"
    }
  ],
  "total": 0,
  "user_total": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|approved_total|integer|false|none||none|
|data|[[auth_defense.ListSourceUserItem](#schemaauth_defense.listsourceuseritem)]|false|none||none|
|total|integer|false|none||none|
|user_total|integer|false|none||none|

<h2 id="tocS_auth_defense.Log">auth_defense.Log</h2>

<a id="schemaauth_defense.log"></a>
<a id="schema_auth_defense.Log"></a>
<a id="tocSauth_defense.log"></a>
<a id="tocsauth_defense.log"></a>

```json
{
  "city": "string",
  "country": "string",
  "created_at": "string",
  "deny_count": 0,
  "dur_sec": 0,
  "ended_at": 0,
  "event_id": "string",
  "id": 0,
  "ip": "string",
  "pass_count": 0,
  "province": "string",
  "rule_id": 0,
  "site_comment": "string",
  "site_icon": "string",
  "site_id": 0,
  "site_server_names": [
    "string"
  ],
  "site_title": "string",
  "started_at": 0,
  "trigger_count": 0,
  "updated_at": "string",
  "username": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|city|string|false|none||none|
|country|string|false|none||none|
|created_at|string|false|none||none|
|deny_count|integer|false|none||none|
|dur_sec|integer|false|none||none|
|ended_at|integer|false|none||none|
|event_id|string|false|none||none|
|id|integer|false|none||none|
|ip|string|false|none||none|
|pass_count|integer|false|none||none|
|province|string|false|none||none|
|rule_id|integer|false|none||none|
|site_comment|string|false|none||none|
|site_icon|string|false|none||none|
|site_id|integer|false|none||none|
|site_server_names|[string]|false|none||none|
|site_title|string|false|none||none|
|started_at|integer|false|none||none|
|trigger_count|integer|false|none||none|
|updated_at|string|false|none||none|
|username|string|false|none||none|

<h2 id="tocS_auth_defense.PutSourceUserReq">auth_defense.PutSourceUserReq</h2>

<a id="schemaauth_defense.putsourceuserreq"></a>
<a id="schema_auth_defense.PutSourceUserReq"></a>
<a id="tocSauth_defense.putsourceuserreq"></a>
<a id="tocsauth_defense.putsourceuserreq"></a>

```json
{
  "status": 1
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|status|[model.AuthDefenseSourceUserStatus](#schemamodel.authdefensesourceuserstatus)|true|none||none|

#### 枚举值

|属性|值|
|---|---|
|status|1|
|status|2|

<h2 id="tocS_auth_defense.UpdateSourceReq">auth_defense.UpdateSourceReq</h2>

<a id="schemaauth_defense.updatesourcereq"></a>
<a id="schema_auth_defense.UpdateSourceReq"></a>
<a id="tocSauth_defense.updatesourcereq"></a>
<a id="tocsauth_defense.updatesourcereq"></a>

```json
{
  "auth": {
    "oauth2": {
      "app_id": "string",
      "app_secret": "string"
    }
  },
  "comment": "string",
  "user": [
    {
      "password": "string",
      "username": "string"
    }
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|auth|[model.PolicyAuth](#schemamodel.policyauth)|false|none||none|
|comment|string|false|none||none|
|user|[[model.PolicyUser](#schemamodel.policyuser)]|false|none||none|

<h2 id="tocS_business.GetFrontendStyleRes">business.GetFrontendStyleRes</h2>

<a id="schemabusiness.getfrontendstyleres"></a>
<a id="schema_business.GetFrontendStyleRes"></a>
<a id="tocSbusiness.getfrontendstyleres"></a>
<a id="tocsbusiness.getfrontendstyleres"></a>

```json
{
  "icon": "string",
  "title": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|icon|string|false|none||none|
|title|string|false|none||none|

<h2 id="tocS_business.PutFrontendStyleReq">business.PutFrontendStyleReq</h2>

<a id="schemabusiness.putfrontendstylereq"></a>
<a id="schema_business.PutFrontendStyleReq"></a>
<a id="tocSbusiness.putfrontendstylereq"></a>
<a id="tocsbusiness.putfrontendstylereq"></a>

```json
{
  "icon": "string",
  "title": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|icon|string|false|none||none|
|title|string|false|none||none|

<h2 id="tocS_cert.CertDetail">cert.CertDetail</h2>

<a id="schemacert.certdetail"></a>
<a id="schema_cert.CertDetail"></a>
<a id="tocScert.certdetail"></a>
<a id="tocscert.certdetail"></a>

```json
{
  "acme": {
    "domains": [
      "string"
    ],
    "email": "string"
  },
  "id": 0,
  "manual": {
    "crt": "string",
    "key": "string"
  },
  "type": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|acme|[cert.acmeVO](#schemacert.acmevo)|false|none||none|
|id|integer|false|none||none|
|manual|[cert.manual](#schemacert.manual)|false|none||none|
|type|integer|false|none||none|

<h2 id="tocS_cert.acmeVO">cert.acmeVO</h2>

<a id="schemacert.acmevo"></a>
<a id="schema_cert.acmeVO"></a>
<a id="tocScert.acmevo"></a>
<a id="tocscert.acmevo"></a>

```json
{
  "domains": [
    "string"
  ],
  "email": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|domains|[string]|false|none||none|
|email|string|false|none||none|

<h2 id="tocS_cert.manual">cert.manual</h2>

<a id="schemacert.manual"></a>
<a id="schema_cert.manual"></a>
<a id="tocScert.manual"></a>
<a id="tocscert.manual"></a>

```json
{
  "crt": "string",
  "key": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|crt|string|false|none||none|
|key|string|false|none||none|

<h2 id="tocS_cloud.SubCloudPolicyReq">cloud.SubCloudPolicyReq</h2>

<a id="schemacloud.subcloudpolicyreq"></a>
<a id="schema_cloud.SubCloudPolicyReq"></a>
<a id="tocScloud.subcloudpolicyreq"></a>
<a id="tocscloud.subcloudpolicyreq"></a>

```json
{
  "id": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer|false|none||none|

<h2 id="tocS_consts.UserRole">consts.UserRole</h2>

<a id="schemaconsts.userrole"></a>
<a id="schema_consts.UserRole"></a>
<a id="tocSconsts.userrole"></a>
<a id="tocsconsts.userrole"></a>

```json
0

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|*anonymous*|integer|false|none||none|

#### 枚举值

|属性|值|
|---|---|
|*anonymous*|0|
|*anonymous*|1|
|*anonymous*|2|
|*anonymous*|3|
|*anonymous*|4|
|*anonymous*|5|

<h2 id="tocS_detect.SkynetInfo">detect.SkynetInfo</h2>

<a id="schemadetect.skynetinfo"></a>
<a id="schema_detect.SkynetInfo"></a>
<a id="tocSdetect.skynetinfo"></a>
<a id="tocsdetect.skynetinfo"></a>

```json
{
  "attack_type": 0,
  "id": "string",
  "mode": "string",
  "name": "string",
  "risk_level": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|attack_type|integer|false|none||none|
|id|string|false|none||none|
|mode|string|false|none||none|
|name|string|false|none||none|
|risk_level|integer|false|none||none|

<h2 id="tocS_git_in_chaitin_net_patronus_safeline-2_management_webserver_api_cloud.ListItem">git_in_chaitin_net_patronus_safeline-2_management_webserver_api_cloud.ListItem</h2>

<a id="schemagit_in_chaitin_net_patronus_safeline-2_management_webserver_api_cloud.listitem"></a>
<a id="schema_git_in_chaitin_net_patronus_safeline-2_management_webserver_api_cloud.ListItem"></a>
<a id="tocSgit_in_chaitin_net_patronus_safeline-2_management_webserver_api_cloud.listitem"></a>
<a id="tocsgit_in_chaitin_net_patronus_safeline-2_management_webserver_api_cloud.listitem"></a>

```json
{
  "added": true,
  "auth_rule": 0,
  "black_rule": 0,
  "captcha_rule": 0,
  "compatible": 0,
  "created_at": "string",
  "id": 0,
  "org_name": "string",
  "policy_name": "string",
  "tags": [
    "string"
  ],
  "updated_at": "string",
  "white_rule": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|added|boolean|false|none||none|
|auth_rule|integer|false|none||none|
|black_rule|integer|false|none||none|
|captcha_rule|integer|false|none||none|
|compatible|integer|false|none||none|
|created_at|string|false|none||none|
|id|integer|false|none||none|
|org_name|string|false|none||none|
|policy_name|string|false|none||none|
|tags|[string]|false|none||none|
|updated_at|string|false|none||none|
|white_rule|integer|false|none||none|

<h2 id="tocS_ipg.IPGroupVO">ipg.IPGroupVO</h2>

<a id="schemaipg.ipgroupvo"></a>
<a id="schema_ipg.IPGroupVO"></a>
<a id="tocSipg.ipgroupvo"></a>
<a id="tocsipg.ipgroupvo"></a>

```json
{
  "builtin": true,
  "comment": "string",
  "id": 0,
  "ips": [
    "string"
  ],
  "reference": "string",
  "total": 0,
  "updated_at": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|builtin|boolean|false|none||none|
|comment|string|false|none||none|
|id|integer|false|none||none|
|ips|[string]|false|none||none|
|reference|string|false|none||none|
|total|integer|false|none||none|
|updated_at|string|false|none||none|

<h2 id="tocS_model.ACLConfigAction">model.ACLConfigAction</h2>

<a id="schemamodel.aclconfigaction"></a>
<a id="schema_model.ACLConfigAction"></a>
<a id="tocSmodel.aclconfigaction"></a>
<a id="tocsmodel.aclconfigaction"></a>

```json
"ban"

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|*anonymous*|string|false|none||none|

#### 枚举值

|属性|值|
|---|---|
|*anonymous*|ban|
|*anonymous*|challenge|

<h2 id="tocS_model.ACLConfigType">model.ACLConfigType</h2>

<a id="schemamodel.aclconfigtype"></a>
<a id="schema_model.ACLConfigType"></a>
<a id="tocSmodel.aclconfigtype"></a>
<a id="tocsmodel.aclconfigtype"></a>

```json
"req"

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|*anonymous*|string|false|none||none|

#### 枚举值

|属性|值|
|---|---|
|*anonymous*|req|
|*anonymous*|attack|
|*anonymous*|error|

<h2 id="tocS_model.AccountConfig">model.AccountConfig</h2>

<a id="schemamodel.accountconfig"></a>
<a id="schema_model.AccountConfig"></a>
<a id="tocSmodel.accountconfig"></a>
<a id="tocsmodel.accountconfig"></a>

```json
{
  "access_whitelist": [
    "string"
  ],
  "expired_unit": "day",
  "login_expire": 0,
  "password_complex": [
    0
  ],
  "password_expire_day": 0,
  "password_length": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|access_whitelist|[string]|true|none||ip 或 cidr|
|expired_unit|[model.ExpireUnit](#schemamodel.expireunit)|false|none||过期时间单位, day, hour, minute|
|login_expire|integer|false|none||过期秒数|
|password_complex|[[model.PasswordChar](#schemamodel.passwordchar)]|false|none||none|
|password_expire_day|integer|false|none||过期天数|
|password_length|integer|false|none||none|

<h2 id="tocS_model.AuthDefenseSource">model.AuthDefenseSource</h2>

<a id="schemamodel.authdefensesource"></a>
<a id="schema_model.AuthDefenseSource"></a>
<a id="tocSmodel.authdefensesource"></a>
<a id="tocsmodel.authdefensesource"></a>

```json
{
  "auth": {
    "oauth2": {
      "app_id": "string",
      "app_secret": "string"
    }
  },
  "comment": "string",
  "created_at": "string",
  "id": 0,
  "type": 0,
  "updated_at": "string",
  "user": [
    {
      "password": "string",
      "username": "string"
    }
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|auth|[model.PolicyAuth](#schemamodel.policyauth)|false|none||none|
|comment|string|false|none||none|
|created_at|string|false|none||none|
|id|integer|false|none||none|
|type|[model.AuthDefenseSourceType](#schemamodel.authdefensesourcetype)|false|none||none|
|updated_at|string|false|none||none|
|user|[[model.PolicyUser](#schemamodel.policyuser)]|false|none||none|

<h2 id="tocS_model.AuthDefenseSourceType">model.AuthDefenseSourceType</h2>

<a id="schemamodel.authdefensesourcetype"></a>
<a id="schema_model.AuthDefenseSourceType"></a>
<a id="tocSmodel.authdefensesourcetype"></a>
<a id="tocsmodel.authdefensesourcetype"></a>

```json
0

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|*anonymous*|integer|false|none||none|

#### 枚举值

|属性|值|
|---|---|
|*anonymous*|0|
|*anonymous*|1|
|*anonymous*|2|
|*anonymous*|3|

<h2 id="tocS_model.AuthDefenseSourceUserStatus">model.AuthDefenseSourceUserStatus</h2>

<a id="schemamodel.authdefensesourceuserstatus"></a>
<a id="schema_model.AuthDefenseSourceUserStatus"></a>
<a id="tocSmodel.authdefensesourceuserstatus"></a>
<a id="tocsmodel.authdefensesourceuserstatus"></a>

```json
0

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|*anonymous*|integer|false|none||none|

#### 枚举值

|属性|值|
|---|---|
|*anonymous*|0|
|*anonymous*|1|
|*anonymous*|2|

<h2 id="tocS_model.Chaos">model.Chaos</h2>

<a id="schemamodel.chaos"></a>
<a id="schema_model.Chaos"></a>
<a id="tocSmodel.chaos"></a>
<a id="tocsmodel.chaos"></a>

```json
{
  "created_at": "string",
  "html_encryption": true,
  "html_fast_decryption": true,
  "id": 0,
  "img_encryption": true,
  "img_text": "string",
  "img_watermark": "string",
  "is_enabled": true,
  "js_encryption": true,
  "js_path": [
    "string"
  ],
  "name": "string",
  "updated_at": "string",
  "website_id": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|created_at|string|false|none||none|
|html_encryption|boolean|false|none||none|
|html_fast_decryption|boolean|false|none||none|
|id|integer|false|none||none|
|img_encryption|boolean|false|none||none|
|img_text|string|false|none||none|
|img_watermark|string|false|none||none|
|is_enabled|boolean|false|none||none|
|js_encryption|boolean|false|none||none|
|js_path|[string]|false|none||none|
|name|string|false|none||none|
|updated_at|string|false|none||none|
|website_id|integer|false|none||none|

<h2 id="tocS_model.CommonColor">model.CommonColor</h2>

<a id="schemamodel.commoncolor"></a>
<a id="schema_model.CommonColor"></a>
<a id="tocSmodel.commoncolor"></a>
<a id="tocsmodel.commoncolor"></a>

```json
{
  "font_color": "string",
  "light_font_color": "string",
  "light_primary_color": "string",
  "primary_color": "string",
  "success_color": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|font_color|string|false|none||none|
|light_font_color|string|false|none||none|
|light_primary_color|string|false|none||none|
|primary_color|string|false|none||none|
|success_color|string|false|none||none|

<h2 id="tocS_model.DetectLog">model.DetectLog</h2>

<a id="schemamodel.detectlog"></a>
<a id="schema_model.DetectLog"></a>
<a id="tocSmodel.detectlog"></a>
<a id="tocsmodel.detectlog"></a>

```json
{
  "action": 0,
  "attack_type": 0,
  "city": "string",
  "country": "string",
  "decode_path": "string",
  "dst_ip": "string",
  "dst_port": 0,
  "eventId": "string",
  "event_id": "string",
  "host": "string",
  "id": 0,
  "lat": "string",
  "lng": "string",
  "location": "string",
  "method": "string",
  "module": "string",
  "payload": "string",
  "policy_name": "string",
  "protocol": 0,
  "province": "string",
  "query_string": "string",
  "reason": "string",
  "req_body": "string",
  "req_header": "string",
  "risk_level": 0,
  "rsp_body": "string",
  "rsp_header": "string",
  "rule_id": "string",
  "rule_id_list": [
    "string"
  ],
  "short_rule_id": "string",
  "site_uuid": "string",
  "socket_ip": "string",
  "src_ip": "string",
  "src_port": 0,
  "status_code": 0,
  "timestamp": 0,
  "url_path": "string",
  "website": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|action|integer|false|none||none|
|attack_type|integer|false|none||none|
|city|string|false|none||none|
|country|string|false|none||none|
|decode_path|string|false|none||none|
|dst_ip|string|false|none||none|
|dst_port|integer|false|none||none|
|eventId|string|false|none||none|
|event_id|string|false|none||to eliminate ambiguous|
|host|string|false|none||none|
|id|integer|false|none||none|
|lat|string|false|none||none|
|lng|string|false|none||none|
|location|string|false|none||none|
|method|string|false|none||none|
|module|string|false|none||none|
|payload|string|false|none||none|
|policy_name|string|false|none||none|
|protocol|integer|false|none||none|
|province|string|false|none||none|
|query_string|string|false|none||none|
|reason|string|false|none||none|
|req_body|string|false|none||none|
|req_header|string|false|none||none|
|risk_level|integer|false|none||none|
|rsp_body|string|false|none||none|
|rsp_header|string|false|none||none|
|rule_id|string|false|none||none|
|rule_id_list|[string]|false|none||none|
|short_rule_id|string|false|none||none|
|site_uuid|string|false|none||none|
|socket_ip|string|false|none||none|
|src_ip|string|false|none||none|
|src_port|integer|false|none||none|
|status_code|integer|false|none||none|
|timestamp|integer|false|none||none|
|url_path|string|false|none||none|
|website|string|false|none||none|

<h2 id="tocS_model.ErrorColor">model.ErrorColor</h2>

<a id="schemamodel.errorcolor"></a>
<a id="schema_model.ErrorColor"></a>
<a id="tocSmodel.errorcolor"></a>
<a id="tocsmodel.errorcolor"></a>

```json
{
  "warning_color": "string",
  "warning_font_color": "string",
  "warning_light_font_color": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|warning_color|string|false|none||none|
|warning_font_color|string|false|none||none|
|warning_light_font_color|string|false|none||none|

<h2 id="tocS_model.ExpireUnit">model.ExpireUnit</h2>

<a id="schemamodel.expireunit"></a>
<a id="schema_model.ExpireUnit"></a>
<a id="tocSmodel.expireunit"></a>
<a id="tocsmodel.expireunit"></a>

```json
"day"

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|*anonymous*|string|false|none||none|

#### 枚举值

|属性|值|
|---|---|
|*anonymous*|day|
|*anonymous*|hour|
|*anonymous*|minute|

<h2 id="tocS_model.HttpHeader">model.HttpHeader</h2>

<a id="schemamodel.httpheader"></a>
<a id="schema_model.HttpHeader"></a>
<a id="tocSmodel.httpheader"></a>
<a id="tocsmodel.httpheader"></a>

```json
{
  "key": "string",
  "op": "string",
  "target": "string",
  "val": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|key|string|false|none||none|
|op|string|false|none||none|
|target|string|false|none||none|
|val|string|false|none||none|

<h2 id="tocS_model.Intelligence">model.Intelligence</h2>

<a id="schemamodel.intelligence"></a>
<a id="schema_model.Intelligence"></a>
<a id="tocSmodel.intelligence"></a>
<a id="tocsmodel.intelligence"></a>

```json
{
  "ip_group_id": 0,
  "policy_rule_id": 0,
  "share_enabled": true,
  "updated_at": "string",
  "use_commercial_lib": true
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|ip_group_id|integer|false|none||none|
|policy_rule_id|integer|false|none||none|
|share_enabled|boolean|false|none||none|
|updated_at|string|false|none||none|
|use_commercial_lib|boolean|false|none||none|

<h2 id="tocS_model.LoadBalanceConfig">model.LoadBalanceConfig</h2>

<a id="schemamodel.loadbalanceconfig"></a>
<a id="schema_model.LoadBalanceConfig"></a>
<a id="tocSmodel.loadbalanceconfig"></a>
<a id="tocsmodel.loadbalanceconfig"></a>

```json
{
  "balance_type": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|balance_type|integer|false|none||none|

<h2 id="tocS_model.ManagerInfo">model.ManagerInfo</h2>

<a id="schemamodel.managerinfo"></a>
<a id="schema_model.ManagerInfo"></a>
<a id="tocSmodel.managerinfo"></a>
<a id="tocsmodel.managerinfo"></a>

```json
{
  "common_color": {
    "font_color": "string",
    "light_font_color": "string",
    "light_primary_color": "string",
    "primary_color": "string",
    "success_color": "string"
  },
  "error_color": {
    "warning_color": "string",
    "warning_font_color": "string",
    "warning_light_font_color": "string"
  },
  "manager_info": "string",
  "page_manager_info": {
    "property1": "string",
    "property2": "string"
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|common_color|[model.CommonColor](#schemamodel.commoncolor)|false|none||none|
|error_color|[model.ErrorColor](#schemamodel.errorcolor)|false|none||none|
|manager_info|string|false|none||none|
|page_manager_info|object|false|none||none|
|» **additionalProperties**|string|false|none||none|

<h2 id="tocS_model.PasswordChar">model.PasswordChar</h2>

<a id="schemamodel.passwordchar"></a>
<a id="schema_model.PasswordChar"></a>
<a id="tocSmodel.passwordchar"></a>
<a id="tocsmodel.passwordchar"></a>

```json
0

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|*anonymous*|integer|false|none||none|

#### 枚举值

|属性|值|
|---|---|
|*anonymous*|0|
|*anonymous*|1|
|*anonymous*|2|
|*anonymous*|3|
|*anonymous*|4|

<h2 id="tocS_model.PolicyAction">model.PolicyAction</h2>

<a id="schemamodel.policyaction"></a>
<a id="schema_model.PolicyAction"></a>
<a id="tocSmodel.policyaction"></a>
<a id="tocsmodel.policyaction"></a>

```json
0

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|*anonymous*|integer|false|none||none|

#### 枚举值

|属性|值|
|---|---|
|*anonymous*|0|
|*anonymous*|1|
|*anonymous*|2|
|*anonymous*|3|
|*anonymous*|4|
|*anonymous*|5|
|*anonymous*|999|
|*anonymous*|999|

<h2 id="tocS_model.PolicyAuth">model.PolicyAuth</h2>

<a id="schemamodel.policyauth"></a>
<a id="schema_model.PolicyAuth"></a>
<a id="tocSmodel.policyauth"></a>
<a id="tocsmodel.policyauth"></a>

```json
{
  "oauth2": {
    "app_id": "string",
    "app_secret": "string"
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|oauth2|[model.PolicyAuthOauth2](#schemamodel.policyauthoauth2)|false|none||none|

<h2 id="tocS_model.PolicyAuthOauth2">model.PolicyAuthOauth2</h2>

<a id="schemamodel.policyauthoauth2"></a>
<a id="schema_model.PolicyAuthOauth2"></a>
<a id="tocSmodel.policyauthoauth2"></a>
<a id="tocsmodel.policyauthoauth2"></a>

```json
{
  "app_id": "string",
  "app_secret": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|app_id|string|false|none||none|
|app_secret|string|false|none||none|

<h2 id="tocS_model.PolicyGroup">model.PolicyGroup</h2>

<a id="schemamodel.policygroup"></a>
<a id="schema_model.PolicyGroup"></a>
<a id="tocSmodel.policygroup"></a>
<a id="tocsmodel.policygroup"></a>

```json
{
  "property1": "string",
  "property2": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|**additionalProperties**|string|false|none||none|

<h2 id="tocS_model.PolicyUser">model.PolicyUser</h2>

<a id="schemamodel.policyuser"></a>
<a id="schema_model.PolicyUser"></a>
<a id="tocSmodel.policyuser"></a>
<a id="tocsmodel.policyuser"></a>

```json
{
  "password": "string",
  "username": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|password|string|false|none||none|
|username|string|false|none||none|

<h2 id="tocS_model.ProxyConfig">model.ProxyConfig</h2>

<a id="schemamodel.proxyconfig"></a>
<a id="schema_model.ProxyConfig"></a>
<a id="tocSmodel.proxyconfig"></a>
<a id="tocsmodel.proxyconfig"></a>

```json
{
  "br": {
    "global": true,
    "value": true
  },
  "created_at": "string",
  "default_server": {
    "global": true,
    "value": true
  },
  "force_https": {
    "global": true,
    "value": true
  },
  "global_ipv6": {
    "global": true,
    "value": true
  },
  "global_ssl_ciphers": {
    "global": true,
    "value": "string"
  },
  "global_ssl_protocols": {
    "global": true,
    "value": "string"
  },
  "gzip": {
    "global": true,
    "value": true
  },
  "host": {
    "global": true,
    "value": "string"
  },
  "hsts": {
    "global": true,
    "value": true
  },
  "hsts_max_age": {
    "global": true,
    "value": "string"
  },
  "hsts_preload": {
    "global": true,
    "value": true
  },
  "hsts_sub": {
    "global": true,
    "value": true
  },
  "http2": {
    "global": true,
    "value": true
  },
  "http3": {
    "global": true,
    "value": true
  },
  "http_1.0": {
    "global": true,
    "value": true
  },
  "http_headers": {
    "global": true,
    "value": [
      {
        "key": "string",
        "op": "string",
        "target": "string",
        "val": "string"
      }
    ]
  },
  "id": 0,
  "ip_source": {
    "global": true,
    "value": "string"
  },
  "ip_value": {
    "global": true,
    "value": "string"
  },
  "ipv6": {
    "global": true,
    "value": true
  },
  "reset_xff": {
    "global": true,
    "value": true
  },
  "site_id": 0,
  "ssl_ciphers": {
    "global": true,
    "value": "string"
  },
  "ssl_protocols": {
    "global": true,
    "value": "string"
  },
  "updated_at": "string",
  "xfh": {
    "global": true,
    "value": "string"
  },
  "xfp": {
    "global": true,
    "value": "string"
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|br|[model.ProxyItem-bool](#schemamodel.proxyitem-bool)|false|none||none|
|created_at|string|false|none||none|
|default_server|[model.ProxyItem-bool](#schemamodel.proxyitem-bool)|false|none||none|
|force_https|[model.ProxyItem-bool](#schemamodel.proxyitem-bool)|false|none||none|
|global_ipv6|[model.ProxyItem-bool](#schemamodel.proxyitem-bool)|false|none||none|
|global_ssl_ciphers|[model.ProxyItem-string](#schemamodel.proxyitem-string)|false|none||none|
|global_ssl_protocols|[model.ProxyItem-string](#schemamodel.proxyitem-string)|false|none||none|
|gzip|[model.ProxyItem-bool](#schemamodel.proxyitem-bool)|false|none||none|
|host|[model.ProxyItem-string](#schemamodel.proxyitem-string)|false|none||none|
|hsts|[model.ProxyItem-bool](#schemamodel.proxyitem-bool)|false|none||none|
|hsts_max_age|[model.ProxyItem-string](#schemamodel.proxyitem-string)|false|none||none|
|hsts_preload|[model.ProxyItem-bool](#schemamodel.proxyitem-bool)|false|none||none|
|hsts_sub|[model.ProxyItem-bool](#schemamodel.proxyitem-bool)|false|none||none|
|http2|[model.ProxyItem-bool](#schemamodel.proxyitem-bool)|false|none||none|
|http3|[model.ProxyItem-bool](#schemamodel.proxyitem-bool)|false|none||none|
|http_1.0|[model.ProxyItem-bool](#schemamodel.proxyitem-bool)|false|none||none|
|http_headers|[model.ProxyItem-model_HttpHeaders](#schemamodel.proxyitem-model_httpheaders)|false|none||none|
|id|integer|false|none||none|
|ip_source|[model.ProxyItem-string](#schemamodel.proxyitem-string)|false|none||none|
|ip_value|[model.ProxyItem-string](#schemamodel.proxyitem-string)|false|none||none|
|ipv6|[model.ProxyItem-bool](#schemamodel.proxyitem-bool)|false|none||none|
|reset_xff|[model.ProxyItem-bool](#schemamodel.proxyitem-bool)|false|none||none|
|site_id|integer|false|none||none|
|ssl_ciphers|[model.ProxyItem-string](#schemamodel.proxyitem-string)|false|none||none|
|ssl_protocols|[model.ProxyItem-string](#schemamodel.proxyitem-string)|false|none||SSLMode      ProxyItem[string] `gorm:"column:ssl_mode;type:jsonb;" json:"ssl_mode"`|
|updated_at|string|false|none||none|
|xfh|[model.ProxyItem-string](#schemamodel.proxyitem-string)|false|none||none|
|xfp|[model.ProxyItem-string](#schemamodel.proxyitem-string)|false|none||none|

<h2 id="tocS_model.ProxyItem-bool">model.ProxyItem-bool</h2>

<a id="schemamodel.proxyitem-bool"></a>
<a id="schema_model.ProxyItem-bool"></a>
<a id="tocSmodel.proxyitem-bool"></a>
<a id="tocsmodel.proxyitem-bool"></a>

```json
{
  "global": true,
  "value": true
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|global|boolean|false|none||none|
|value|boolean|false|none||none|

<h2 id="tocS_model.ProxyItem-model_HttpHeaders">model.ProxyItem-model_HttpHeaders</h2>

<a id="schemamodel.proxyitem-model_httpheaders"></a>
<a id="schema_model.ProxyItem-model_HttpHeaders"></a>
<a id="tocSmodel.proxyitem-model_httpheaders"></a>
<a id="tocsmodel.proxyitem-model_httpheaders"></a>

```json
{
  "global": true,
  "value": [
    {
      "key": "string",
      "op": "string",
      "target": "string",
      "val": "string"
    }
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|global|boolean|false|none||none|
|value|[[model.HttpHeader](#schemamodel.httpheader)]|false|none||none|

<h2 id="tocS_model.ProxyItem-string">model.ProxyItem-string</h2>

<a id="schemamodel.proxyitem-string"></a>
<a id="schema_model.ProxyItem-string"></a>
<a id="tocSmodel.proxyitem-string"></a>
<a id="tocsmodel.proxyitem-string"></a>

```json
{
  "global": true,
  "value": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|global|boolean|false|none||none|
|value|string|false|none||none|

<h2 id="tocS_model.ReceiverConfig">model.ReceiverConfig</h2>

<a id="schemamodel.receiverconfig"></a>
<a id="schema_model.ReceiverConfig"></a>
<a id="tocSmodel.receiverconfig"></a>
<a id="tocsmodel.receiverconfig"></a>

```json
{
  "host": "string",
  "label": "string",
  "log_types": [
    "string"
  ],
  "port": 0,
  "protocol": "string",
  "rfc": "string",
  "type": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|host|string|false|none||none|
|label|string|false|none||none|
|log_types|[string]|false|none||none|
|port|integer|false|none||none|
|protocol|string|false|none||none|
|rfc|string|false|none||none|
|type|string|false|none||none|

<h2 id="tocS_model.ReportData">model.ReportData</h2>

<a id="schemamodel.reportdata"></a>
<a id="schema_model.ReportData"></a>
<a id="tocSmodel.reportdata"></a>
<a id="tocsmodel.reportdata"></a>

```json
{
  "attack": {
    "src_ip": [
      {
        "city": "string",
        "count": 0,
        "country": "string",
        "key": "string",
        "province": "string"
      }
    ],
    "type": [
      {
        "count": 0,
        "key": "string"
      }
    ],
    "website": [
      {
        "count": 0,
        "key": "string"
      }
    ]
  },
  "count": {
    "intercept": 0,
    "ip": 0,
    "request": 0,
    "uv": 0,
    "website": 0
  },
  "geo": {
    "intercept_country": [
      {
        "count": 0,
        "location": "string"
      }
    ],
    "intercept_province": [
      {
        "count": 0,
        "location": "string"
      }
    ],
    "request_country": [
      {
        "count": 0,
        "location": "string"
      }
    ],
    "request_province": [
      {
        "count": 0,
        "location": "string"
      }
    ]
  },
  "trend": {
    "intercept": [
      {
        "count": 0,
        "trend_time": 0
      }
    ],
    "request": [
      {
        "count": 0,
        "trend_time": 0
      }
    ]
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|attack|[model.ReportDataAttack](#schemamodel.reportdataattack)|false|none||none|
|count|[model.ReportDataCount](#schemamodel.reportdatacount)|false|none||none|
|geo|[model.ReportDataGeo](#schemamodel.reportdatageo)|false|none||none|
|trend|[model.ReportDataTrend](#schemamodel.reportdatatrend)|false|none||none|

<h2 id="tocS_model.ReportDataAttack">model.ReportDataAttack</h2>

<a id="schemamodel.reportdataattack"></a>
<a id="schema_model.ReportDataAttack"></a>
<a id="tocSmodel.reportdataattack"></a>
<a id="tocsmodel.reportdataattack"></a>

```json
{
  "src_ip": [
    {
      "city": "string",
      "count": 0,
      "country": "string",
      "key": "string",
      "province": "string"
    }
  ],
  "type": [
    {
      "count": 0,
      "key": "string"
    }
  ],
  "website": [
    {
      "count": 0,
      "key": "string"
    }
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|src_ip|[[model.ReportDataAttackGeoItem](#schemamodel.reportdataattackgeoitem)]|false|none||none|
|type|[[model.ReportDataAttackItem](#schemamodel.reportdataattackitem)]|false|none||none|
|website|[[model.ReportDataAttackItem](#schemamodel.reportdataattackitem)]|false|none||none|

<h2 id="tocS_model.ReportDataAttackGeoItem">model.ReportDataAttackGeoItem</h2>

<a id="schemamodel.reportdataattackgeoitem"></a>
<a id="schema_model.ReportDataAttackGeoItem"></a>
<a id="tocSmodel.reportdataattackgeoitem"></a>
<a id="tocsmodel.reportdataattackgeoitem"></a>

```json
{
  "city": "string",
  "count": 0,
  "country": "string",
  "key": "string",
  "province": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|city|string|false|none||none|
|count|integer|false|none||none|
|country|string|false|none||none|
|key|string|false|none||none|
|province|string|false|none||none|

<h2 id="tocS_model.ReportDataAttackItem">model.ReportDataAttackItem</h2>

<a id="schemamodel.reportdataattackitem"></a>
<a id="schema_model.ReportDataAttackItem"></a>
<a id="tocSmodel.reportdataattackitem"></a>
<a id="tocsmodel.reportdataattackitem"></a>

```json
{
  "count": 0,
  "key": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|count|integer|false|none||none|
|key|string|false|none||none|

<h2 id="tocS_model.ReportDataCount">model.ReportDataCount</h2>

<a id="schemamodel.reportdatacount"></a>
<a id="schema_model.ReportDataCount"></a>
<a id="tocSmodel.reportdatacount"></a>
<a id="tocsmodel.reportdatacount"></a>

```json
{
  "intercept": 0,
  "ip": 0,
  "request": 0,
  "uv": 0,
  "website": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|intercept|integer|false|none||none|
|ip|integer|false|none||none|
|request|integer|false|none||none|
|uv|integer|false|none||none|
|website|integer|false|none||none|

<h2 id="tocS_model.ReportDataGeo">model.ReportDataGeo</h2>

<a id="schemamodel.reportdatageo"></a>
<a id="schema_model.ReportDataGeo"></a>
<a id="tocSmodel.reportdatageo"></a>
<a id="tocsmodel.reportdatageo"></a>

```json
{
  "intercept_country": [
    {
      "count": 0,
      "location": "string"
    }
  ],
  "intercept_province": [
    {
      "count": 0,
      "location": "string"
    }
  ],
  "request_country": [
    {
      "count": 0,
      "location": "string"
    }
  ],
  "request_province": [
    {
      "count": 0,
      "location": "string"
    }
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|intercept_country|[[model.ReportDataGeoItem](#schemamodel.reportdatageoitem)]|false|none||none|
|intercept_province|[[model.ReportDataGeoItem](#schemamodel.reportdatageoitem)]|false|none||none|
|request_country|[[model.ReportDataGeoItem](#schemamodel.reportdatageoitem)]|false|none||none|
|request_province|[[model.ReportDataGeoItem](#schemamodel.reportdatageoitem)]|false|none||none|

<h2 id="tocS_model.ReportDataGeoItem">model.ReportDataGeoItem</h2>

<a id="schemamodel.reportdatageoitem"></a>
<a id="schema_model.ReportDataGeoItem"></a>
<a id="tocSmodel.reportdatageoitem"></a>
<a id="tocsmodel.reportdatageoitem"></a>

```json
{
  "count": 0,
  "location": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|count|integer|false|none||none|
|location|string|false|none||none|

<h2 id="tocS_model.ReportDataTrend">model.ReportDataTrend</h2>

<a id="schemamodel.reportdatatrend"></a>
<a id="schema_model.ReportDataTrend"></a>
<a id="tocSmodel.reportdatatrend"></a>
<a id="tocsmodel.reportdatatrend"></a>

```json
{
  "intercept": [
    {
      "count": 0,
      "trend_time": 0
    }
  ],
  "request": [
    {
      "count": 0,
      "trend_time": 0
    }
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|intercept|[[model.ReportDataTrendItem](#schemamodel.reportdatatrenditem)]|false|none||none|
|request|[[model.ReportDataTrendItem](#schemamodel.reportdatatrenditem)]|false|none||none|

<h2 id="tocS_model.ReportDataTrendItem">model.ReportDataTrendItem</h2>

<a id="schemamodel.reportdatatrenditem"></a>
<a id="schema_model.ReportDataTrendItem"></a>
<a id="tocSmodel.reportdatatrenditem"></a>
<a id="tocsmodel.reportdatatrenditem"></a>

```json
{
  "count": 0,
  "trend_time": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|count|integer|false|none||none|
|trend_time|integer|false|none||none|

<h2 id="tocS_model.Resource">model.Resource</h2>

<a id="schemamodel.resource"></a>
<a id="schema_model.Resource"></a>
<a id="tocSmodel.resource"></a>
<a id="tocsmodel.resource"></a>

```json
{
  "content_length": 0,
  "content_type": "string",
  "created_at": "string",
  "id": 0,
  "method": "string",
  "path": "string",
  "req_header": "string",
  "req_today": 0,
  "response_time": 0,
  "site_id": 0,
  "status_code": 0,
  "updated_at": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|content_length|integer|false|none||none|
|content_type|string|false|none||none|
|created_at|string|false|none||none|
|id|integer|false|none||none|
|method|string|false|none||none|
|path|string|false|none||resource content|
|req_header|string|false|none||none|
|req_today|integer|false|none||none|
|response_time|integer|false|none||none|
|site_id|integer|false|none||none|
|status_code|integer|false|none||none|
|updated_at|string|false|none||none|

<h2 id="tocS_model.RulePattern">model.RulePattern</h2>

<a id="schemamodel.rulepattern"></a>
<a id="schema_model.RulePattern"></a>
<a id="tocSmodel.rulepattern"></a>
<a id="tocsmodel.rulepattern"></a>

```json
{
  "k": "string",
  "op": "string",
  "sub_k": "string",
  "v": [
    "string"
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|k|string|false|none||none|
|op|string|false|none||none|
|sub_k|string|false|none||none|
|v|[string]|false|none||none|

<h2 id="tocS_model.SiteCache">model.SiteCache</h2>

<a id="schemamodel.sitecache"></a>
<a id="schema_model.SiteCache"></a>
<a id="tocSmodel.sitecache"></a>
<a id="tocsmodel.sitecache"></a>

```json
{
  "content_types": [
    "string"
  ],
  "prefixes": [
    "string"
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|content_types|[string]|false|none||none|
|prefixes|[string]|false|none||none|

<h2 id="tocS_model.WaitingRoom">model.WaitingRoom</h2>

<a id="schemamodel.waitingroom"></a>
<a id="schema_model.WaitingRoom"></a>
<a id="tocSmodel.waitingroom"></a>
<a id="tocsmodel.waitingroom"></a>

```json
{
  "created_at": "string",
  "id": 0,
  "is_enabled": true,
  "max_concurrent": 0,
  "max_waiting": 0,
  "name": "string",
  "session_timeout": 0,
  "updated_at": "string",
  "website_id": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|created_at|string|false|none||none|
|id|integer|false|none||none|
|is_enabled|boolean|false|none||none|
|max_concurrent|integer|false|none||当前允许最大同时在线的人数|
|max_waiting|integer|false|none||当前允许最大同时排队的人数|
|name|string|false|none||none|
|session_timeout|integer|false|none||服务队列中 session 的存活周期|
|updated_at|string|false|none||none|
|website_id|integer|false|none||none|

<h2 id="tocS_model.WebsiteResource">model.WebsiteResource</h2>

<a id="schemamodel.websiteresource"></a>
<a id="schema_model.WebsiteResource"></a>
<a id="tocSmodel.websiteresource"></a>
<a id="tocsmodel.websiteresource"></a>

```json
{
  "nodes": [
    {
      "content_length": 0,
      "content_type": "string",
      "created_at": "string",
      "id": 0,
      "method": "string",
      "path": "string",
      "req_header": "string",
      "req_today": 0,
      "response_time": 0,
      "site_id": 0,
      "status_code": 0,
      "updated_at": "string"
    }
  ],
  "total": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|nodes|[[model.Resource](#schemamodel.resource)]|false|none||none|
|total|integer|false|none||none|

<h2 id="tocS_policy.DeletePolicyReq">policy.DeletePolicyReq</h2>

<a id="schemapolicy.deletepolicyreq"></a>
<a id="schema_policy.DeletePolicyReq"></a>
<a id="tocSpolicy.deletepolicyreq"></a>
<a id="tocspolicy.deletepolicyreq"></a>

```json
{
  "id": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer|false|none||none|

<h2 id="tocS_policy.GetPolicyRes">policy.GetPolicyRes</h2>

<a id="schemapolicy.getpolicyres"></a>
<a id="schema_policy.GetPolicyRes"></a>
<a id="tocSpolicy.getpolicyres"></a>
<a id="tocspolicy.getpolicyres"></a>

```json
{
  "action": 0,
  "auth_rule": 0,
  "auth_source_ids": [
    0
  ],
  "black_rule": 0,
  "builtin": true,
  "captcha_rule": 0,
  "cloud_id": 0,
  "cloud_total": 0,
  "compatible": 0,
  "created_at": "string",
  "expire": 0,
  "id": 0,
  "is_enabled": true,
  "level": 0,
  "log": true,
  "name": "string",
  "pass_count": 0,
  "pattern": [
    [
      {
        "k": "string",
        "op": "string",
        "sub_k": "string",
        "v": [
          "string"
        ]
      }
    ]
  ],
  "replay": true,
  "req_count": 0,
  "updated_at": "string",
  "white_rule": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|action|integer|false|none||0 -> allow, 1 -> deny|
|auth_rule|integer|false|none||none|
|auth_source_ids|[integer]|false|none||none|
|black_rule|integer|false|none||none|
|builtin|boolean|false|none||none|
|captcha_rule|integer|false|none||none|
|cloud_id|integer|false|none||none|
|cloud_total|integer|false|none||none|
|compatible|integer|false|none||none|
|created_at|string|false|none||none|
|expire|integer|false|none||none|
|id|integer|false|none||none|
|is_enabled|boolean|false|none||none|
|level|integer|false|none||none|
|log|boolean|false|none||none|
|name|string|false|none||none|
|pass_count|integer|false|none||none|
|pattern|[array]|false|none||none|
|replay|boolean|false|none||none|
|req_count|integer|false|none||none|
|updated_at|string|false|none||none|
|white_rule|integer|false|none||none|

<h2 id="tocS_policy.ListPolicyRes">policy.ListPolicyRes</h2>

<a id="schemapolicy.listpolicyres"></a>
<a id="schema_policy.ListPolicyRes"></a>
<a id="tocSpolicy.listpolicyres"></a>
<a id="tocspolicy.listpolicyres"></a>

```json
{
  "data": [
    {
      "action": 0,
      "auth_rule": 0,
      "auth_source_ids": [
        0
      ],
      "black_rule": 0,
      "builtin": true,
      "captcha_rule": 0,
      "cloud_id": 0,
      "cloud_total": 0,
      "compatible": 0,
      "created_at": "string",
      "expire": 0,
      "id": 0,
      "is_enabled": true,
      "level": 0,
      "log": true,
      "name": "string",
      "pass_count": 0,
      "pattern": [
        [
          {
            "k": "string",
            "op": "string",
            "sub_k": "string",
            "v": [
              null
            ]
          }
        ]
      ],
      "replay": true,
      "req_count": 0,
      "updated_at": "string",
      "white_rule": 0
    }
  ],
  "total": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|data|[[policy.GetPolicyRes](#schemapolicy.getpolicyres)]|false|none||none|
|total|integer|false|none||none|

<h2 id="tocS_policy.PostPolicyReq">policy.PostPolicyReq</h2>

<a id="schemapolicy.postpolicyreq"></a>
<a id="schema_policy.PostPolicyReq"></a>
<a id="tocSpolicy.postpolicyreq"></a>
<a id="tocspolicy.postpolicyreq"></a>

```json
{
  "action": 0,
  "auth_source_ids": [
    0
  ],
  "expire": 0,
  "is_enabled": true,
  "level": 0,
  "log": true,
  "name": "string",
  "pattern": [
    [
      {
        "k": "string",
        "op": "string",
        "sub_k": "string",
        "v": [
          "string"
        ]
      }
    ]
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|action|[model.PolicyAction](#schemamodel.policyaction)|false|none||none|
|auth_source_ids|[integer]|false|none||none|
|expire|integer|false|none||none|
|is_enabled|boolean|false|none||none|
|level|integer|false|none||none|
|log|boolean|false|none||none|
|name|string|false|none||none|
|pattern|[array]|false|none||none|

<h2 id="tocS_policy.PutPolicyReq">policy.PutPolicyReq</h2>

<a id="schemapolicy.putpolicyreq"></a>
<a id="schema_policy.PutPolicyReq"></a>
<a id="tocSpolicy.putpolicyreq"></a>
<a id="tocspolicy.putpolicyreq"></a>

```json
{
  "action": 0,
  "auth_source_ids": [
    0
  ],
  "expire": 0,
  "id": 0,
  "is_enabled": true,
  "level": 0,
  "log": true,
  "name": "string",
  "pattern": [
    [
      {
        "k": "string",
        "op": "string",
        "sub_k": "string",
        "v": [
          "string"
        ]
      }
    ]
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|action|[model.PolicyAction](#schemamodel.policyaction)|false|none||none|
|auth_source_ids|[integer]|false|none||none|
|expire|integer|false|none||none|
|id|integer|false|none||none|
|is_enabled|boolean|false|none||none|
|level|integer|false|none||none|
|log|boolean|false|none||none|
|name|string|false|none||none|
|pattern|[array]|false|none||none|

<h2 id="tocS_policy.PutPolicySwitchReq">policy.PutPolicySwitchReq</h2>

<a id="schemapolicy.putpolicyswitchreq"></a>
<a id="schema_policy.PutPolicySwitchReq"></a>
<a id="tocSpolicy.putpolicyswitchreq"></a>
<a id="tocspolicy.putpolicyswitchreq"></a>

```json
{
  "id": 0,
  "is_enabled": true
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer|false|none||none|
|is_enabled|boolean|false|none||none|

<h2 id="tocS_proxy.Config">proxy.Config</h2>

<a id="schemaproxy.config"></a>
<a id="schema_proxy.Config"></a>
<a id="tocSproxy.config"></a>
<a id="tocsproxy.config"></a>

```json
{
  "br": {
    "global": true,
    "value": true
  },
  "default_server": {
    "global": true,
    "value": true
  },
  "force_https": {
    "global": true,
    "value": true
  },
  "gzip": {
    "global": true,
    "value": true
  },
  "host": {
    "global": true,
    "value": "string"
  },
  "hsts": {
    "global": true,
    "value": true
  },
  "hsts_max_age": {
    "global": true,
    "value": "string"
  },
  "hsts_preload": {
    "global": true,
    "value": true
  },
  "hsts_sub": {
    "global": true,
    "value": true
  },
  "http2": {
    "global": true,
    "value": true
  },
  "http3": {
    "global": true,
    "value": true
  },
  "http_1.0": {
    "global": true,
    "value": true
  },
  "http_headers": {
    "global": true,
    "value": [
      {
        "key": "string",
        "op": "string",
        "target": "string",
        "val": "string"
      }
    ]
  },
  "ip_source": {
    "global": true,
    "value": "string"
  },
  "ip_value": {
    "global": true,
    "value": "string"
  },
  "ipv6": {
    "global": true,
    "value": true
  },
  "reset_xff": {
    "global": true,
    "value": true
  },
  "ssl_ciphers": {
    "global": true,
    "value": "string"
  },
  "ssl_protocols": {
    "global": true,
    "value": "string"
  },
  "xfh": {
    "global": true,
    "value": "string"
  },
  "xfp": {
    "global": true,
    "value": "string"
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|br|[model.ProxyItem-bool](#schemamodel.proxyitem-bool)|false|none||none|
|default_server|[model.ProxyItem-bool](#schemamodel.proxyitem-bool)|false|none||none|
|force_https|[model.ProxyItem-bool](#schemamodel.proxyitem-bool)|false|none||none|
|gzip|[model.ProxyItem-bool](#schemamodel.proxyitem-bool)|false|none||none|
|host|[model.ProxyItem-string](#schemamodel.proxyitem-string)|false|none||none|
|hsts|[model.ProxyItem-bool](#schemamodel.proxyitem-bool)|false|none||none|
|hsts_max_age|[model.ProxyItem-string](#schemamodel.proxyitem-string)|false|none||none|
|hsts_preload|[model.ProxyItem-bool](#schemamodel.proxyitem-bool)|false|none||none|
|hsts_sub|[model.ProxyItem-bool](#schemamodel.proxyitem-bool)|false|none||none|
|http2|[model.ProxyItem-bool](#schemamodel.proxyitem-bool)|false|none||none|
|http3|[model.ProxyItem-bool](#schemamodel.proxyitem-bool)|false|none||none|
|http_1.0|[model.ProxyItem-bool](#schemamodel.proxyitem-bool)|false|none||none|
|http_headers|[model.ProxyItem-model_HttpHeaders](#schemamodel.proxyitem-model_httpheaders)|false|none||none|
|ip_source|[model.ProxyItem-string](#schemamodel.proxyitem-string)|false|none||none|
|ip_value|[model.ProxyItem-string](#schemamodel.proxyitem-string)|false|none||none|
|ipv6|[model.ProxyItem-bool](#schemamodel.proxyitem-bool)|false|none||none|
|reset_xff|[model.ProxyItem-bool](#schemamodel.proxyitem-bool)|false|none||none|
|ssl_ciphers|[model.ProxyItem-string](#schemamodel.proxyitem-string)|false|none||none|
|ssl_protocols|[model.ProxyItem-string](#schemamodel.proxyitem-string)|false|none||none|
|xfh|[model.ProxyItem-string](#schemamodel.proxyitem-string)|false|none||none|
|xfp|[model.ProxyItem-string](#schemamodel.proxyitem-string)|false|none||none|

<h2 id="tocS_record.Event">record.Event</h2>

<a id="schemarecord.event"></a>
<a id="schema_record.Event"></a>
<a id="tocSrecord.event"></a>
<a id="tocsrecord.event"></a>

```json
{
  "city": "string",
  "country": "string",
  "deny_count": 0,
  "dst_port": 0,
  "end_at": 0,
  "finished": true,
  "host": "string",
  "id": 0,
  "ip": "string",
  "pass_count": 0,
  "protocol": 0,
  "province": "string",
  "start_at": 0,
  "updated_at": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|city|string|false|none||none|
|country|string|false|none||none|
|deny_count|integer|false|none||none|
|dst_port|integer|false|none||none|
|end_at|integer|false|none||none|
|finished|boolean|false|none||none|
|host|string|false|none||none|
|id|integer|false|none||none|
|ip|string|false|none||none|
|pass_count|integer|false|none||none|
|protocol|integer|false|none||none|
|province|string|false|none||none|
|start_at|integer|false|none||none|
|updated_at|integer|false|none||none|

<h2 id="tocS_record.EventListRes">record.EventListRes</h2>

<a id="schemarecord.eventlistres"></a>
<a id="schema_record.EventListRes"></a>
<a id="tocSrecord.eventlistres"></a>
<a id="tocsrecord.eventlistres"></a>

```json
{
  "nodes": [
    {
      "city": "string",
      "country": "string",
      "deny_count": 0,
      "dst_port": 0,
      "end_at": 0,
      "finished": true,
      "host": "string",
      "id": 0,
      "ip": "string",
      "pass_count": 0,
      "protocol": 0,
      "province": "string",
      "start_at": 0,
      "updated_at": 0
    }
  ],
  "total": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|nodes|[[record.Event](#schemarecord.event)]|false|none||none|
|total|integer|false|none||none|

<h2 id="tocS_record.GetDetectLogListRes">record.GetDetectLogListRes</h2>

<a id="schemarecord.getdetectloglistres"></a>
<a id="schema_record.GetDetectLogListRes"></a>
<a id="tocSrecord.getdetectloglistres"></a>
<a id="tocsrecord.getdetectloglistres"></a>

```json
{
  "data": [
    {
      "action": 0,
      "attack_type": 0,
      "city": "string",
      "country": "string",
      "decode_path": "string",
      "dst_ip": "string",
      "dst_port": 0,
      "eventId": "string",
      "event_id": "string",
      "host": "string",
      "id": 0,
      "lat": "string",
      "lng": "string",
      "location": "string",
      "method": "string",
      "module": "string",
      "payload": "string",
      "policy_name": "string",
      "protocol": 0,
      "province": "string",
      "query_string": "string",
      "reason": "string",
      "req_body": "string",
      "req_header": "string",
      "risk_level": 0,
      "rsp_body": "string",
      "rsp_header": "string",
      "rule_id": "string",
      "rule_id_list": [
        "string"
      ],
      "short_rule_id": "string",
      "site_uuid": "string",
      "socket_ip": "string",
      "src_ip": "string",
      "src_port": 0,
      "status_code": 0,
      "timestamp": 0,
      "url_path": "string",
      "website": "string"
    }
  ],
  "total": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|data|[[model.DetectLog](#schemamodel.detectlog)]|false|none||none|
|total|integer|false|none||none|

<h2 id="tocS_report.CreateReq">report.CreateReq</h2>

<a id="schemareport.createreq"></a>
<a id="schema_report.CreateReq"></a>
<a id="tocSreport.createreq"></a>
<a id="tocsreport.createreq"></a>

```json
{
  "begin_time": 0,
  "end_time": 0,
  "name": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|begin_time|integer|false|none||none|
|end_time|integer|false|none||none|
|name|string|true|none||none|

<h2 id="tocS_report.GetRes">report.GetRes</h2>

<a id="schemareport.getres"></a>
<a id="schema_report.GetRes"></a>
<a id="tocSreport.getres"></a>
<a id="tocsreport.getres"></a>

```json
{
  "begin_time": 0,
  "created_at": 0,
  "data": {
    "attack": {
      "src_ip": [
        {
          "city": "string",
          "count": 0,
          "country": "string",
          "key": "string",
          "province": "string"
        }
      ],
      "type": [
        {
          "count": 0,
          "key": "string"
        }
      ],
      "website": [
        {
          "count": 0,
          "key": "string"
        }
      ]
    },
    "count": {
      "intercept": 0,
      "ip": 0,
      "request": 0,
      "uv": 0,
      "website": 0
    },
    "geo": {
      "intercept_country": [
        {
          "count": 0,
          "location": "string"
        }
      ],
      "intercept_province": [
        {
          "count": 0,
          "location": "string"
        }
      ],
      "request_country": [
        {
          "count": 0,
          "location": "string"
        }
      ],
      "request_province": [
        {
          "count": 0,
          "location": "string"
        }
      ]
    },
    "trend": {
      "intercept": [
        {
          "count": 0,
          "trend_time": 0
        }
      ],
      "request": [
        {
          "count": 0,
          "trend_time": 0
        }
      ]
    }
  },
  "end_time": 0,
  "error": "string",
  "id": 0,
  "name": "string",
  "state": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|begin_time|integer|false|none||none|
|created_at|integer|false|none||none|
|data|[model.ReportData](#schemamodel.reportdata)|false|none||none|
|end_time|integer|false|none||none|
|error|string|false|none||none|
|id|integer|false|none||none|
|name|string|false|none||none|
|state|string|false|none||none|

<h2 id="tocS_report.ListItem">report.ListItem</h2>

<a id="schemareport.listitem"></a>
<a id="schema_report.ListItem"></a>
<a id="tocSreport.listitem"></a>
<a id="tocsreport.listitem"></a>

```json
{
  "created_at": 0,
  "error": "string",
  "id": 0,
  "name": "string",
  "state": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|created_at|integer|false|none||none|
|error|string|false|none||none|
|id|integer|false|none||none|
|name|string|false|none||none|
|state|string|false|none||none|

<h2 id="tocS_report.ListRes">report.ListRes</h2>

<a id="schemareport.listres"></a>
<a id="schema_report.ListRes"></a>
<a id="tocSreport.listres"></a>
<a id="tocsreport.listres"></a>

```json
{
  "data": [
    {
      "created_at": 0,
      "error": "string",
      "id": 0,
      "name": "string",
      "state": "string"
    }
  ],
  "total": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|data|[[report.ListItem](#schemareport.listitem)]|false|none||none|
|total|integer|false|none||none|

<h2 id="tocS_resource.RemoveReq">resource.RemoveReq</h2>

<a id="schemaresource.removereq"></a>
<a id="schema_resource.RemoveReq"></a>
<a id="tocSresource.removereq"></a>
<a id="tocsresource.removereq"></a>

```json
{
  "ids": [
    0
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|ids|[integer]|false|none||none|

<h2 id="tocS_resource.UpdateExcludesReq">resource.UpdateExcludesReq</h2>

<a id="schemaresource.updateexcludesreq"></a>
<a id="schema_resource.UpdateExcludesReq"></a>
<a id="tocSresource.updateexcludesreq"></a>
<a id="tocsresource.updateexcludesreq"></a>

```json
{
  "content_types": [
    "string"
  ],
  "prefixes": [
    "string"
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|content_types|[string]|false|none||none|
|prefixes|[string]|false|none||none|

<h2 id="tocS_response.JSONBody">response.JSONBody</h2>

<a id="schemaresponse.jsonbody"></a>
<a id="schema_response.JSONBody"></a>
<a id="tocSresponse.jsonbody"></a>
<a id="tocsresponse.jsonbody"></a>

```json
{
  "data": null,
  "err": "string",
  "msg": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|data|any|false|none||none|
|err|string|false|none||none|
|msg|string|false|none||none|

<h2 id="tocS_river.Edition">river.Edition</h2>

<a id="schemariver.edition"></a>
<a id="schema_river.Edition"></a>
<a id="tocSriver.edition"></a>
<a id="tocsriver.edition"></a>

```json
0

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|*anonymous*|integer|false|none||none|

#### 枚举值

|属性|值|
|---|---|
|*anonymous*|0|
|*anonymous*|1|
|*anonymous*|2|

<h2 id="tocS_site.AddStaticReq">site.AddStaticReq</h2>

<a id="schemasite.addstaticreq"></a>
<a id="schema_site.AddStaticReq"></a>
<a id="tocSsite.addstaticreq"></a>
<a id="tocssite.addstaticreq"></a>

```json
{
  "dir": true,
  "page": "string",
  "path": "string",
  "zip": true
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|dir|boolean|false|none||none|
|page|string|false|none||none|
|path|string|true|none||none|
|zip|boolean|false|none||none|

<h2 id="tocS_site.AntiTamperCreateReq">site.AntiTamperCreateReq</h2>

<a id="schemasite.antitampercreatereq"></a>
<a id="schema_site.AntiTamperCreateReq"></a>
<a id="tocSsite.antitampercreatereq"></a>
<a id="tocssite.antitampercreatereq"></a>

```json
{
  "resource_ids": [
    0
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|resource_ids|[integer]|false|none||none|

<h2 id="tocS_site.AntiTamperDetailRes">site.AntiTamperDetailRes</h2>

<a id="schemasite.antitamperdetailres"></a>
<a id="schema_site.AntiTamperDetailRes"></a>
<a id="tocSsite.antitamperdetailres"></a>
<a id="tocssite.antitamperdetailres"></a>

```json
{
  "cache_sha256": "string",
  "cache_time": 0,
  "change_sha256": "string",
  "change_time": 0,
  "changed": true,
  "content_type": "string",
  "created_at": 0,
  "id": 0,
  "path": "string",
  "site_id": 0,
  "updated_at": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|cache_sha256|string|false|none||none|
|cache_time|integer|false|none||none|
|change_sha256|string|false|none||none|
|change_time|integer|false|none||none|
|changed|boolean|false|none||none|
|content_type|string|false|none||none|
|created_at|integer|false|none||none|
|id|integer|false|none||none|
|path|string|false|none||none|
|site_id|integer|false|none||none|
|updated_at|integer|false|none||none|

<h2 id="tocS_site.AntiTamperListData">site.AntiTamperListData</h2>

<a id="schemasite.antitamperlistdata"></a>
<a id="schema_site.AntiTamperListData"></a>
<a id="tocSsite.antitamperlistdata"></a>
<a id="tocssite.antitamperlistdata"></a>

```json
{
  "cache_time": 0,
  "changed": true,
  "created_at": 0,
  "id": 0,
  "path": "string",
  "site_id": 0,
  "updated_at": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|cache_time|integer|false|none||none|
|changed|boolean|false|none||none|
|created_at|integer|false|none||none|
|id|integer|false|none||none|
|path|string|false|none||none|
|site_id|integer|false|none||none|
|updated_at|integer|false|none||none|

<h2 id="tocS_site.AntiTamperListRes">site.AntiTamperListRes</h2>

<a id="schemasite.antitamperlistres"></a>
<a id="schema_site.AntiTamperListRes"></a>
<a id="tocSsite.antitamperlistres"></a>
<a id="tocssite.antitamperlistres"></a>

```json
{
  "data": [
    {
      "cache_time": 0,
      "changed": true,
      "created_at": 0,
      "id": 0,
      "path": "string",
      "site_id": 0,
      "updated_at": 0
    }
  ],
  "refresh_state": "string",
  "refresh_time": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|data|[[site.AntiTamperListData](#schemasite.antitamperlistdata)]|false|none||none|
|refresh_state|string|false|none||none|
|refresh_time|integer|false|none||none|

<h2 id="tocS_site.DeleteStaticReq">site.DeleteStaticReq</h2>

<a id="schemasite.deletestaticreq"></a>
<a id="schema_site.DeleteStaticReq"></a>
<a id="tocSsite.deletestaticreq"></a>
<a id="tocssite.deletestaticreq"></a>

```json
{
  "path": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|path|string|true|none||none|

<h2 id="tocS_site.DeleteWebsiteReq">site.DeleteWebsiteReq</h2>

<a id="schemasite.deletewebsitereq"></a>
<a id="schema_site.DeleteWebsiteReq"></a>
<a id="tocSsite.deletewebsitereq"></a>
<a id="tocssite.deletewebsitereq"></a>

```json
{
  "ids": [
    0
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|ids|[integer]|false|none||none|

<h2 id="tocS_site.GetWebsiteDetailRes">site.GetWebsiteDetailRes</h2>

<a id="schemasite.getwebsitedetailres"></a>
<a id="schema_site.GetWebsiteDetailRes"></a>
<a id="tocSsite.getwebsitedetailres"></a>
<a id="tocssite.getwebsitedetailres"></a>

```json
{
  "access_log_limit": 0,
  "acl_enabled": true,
  "acl_response_html_path": "string",
  "acl_response_status_code": 0,
  "auth_defense_id": 0,
  "bad_gateway_html_path": "string",
  "bad_gateway_status_code": 0,
  "cc_bot": true,
  "cert_filename": "string",
  "cert_id": 0,
  "cert_type": 0,
  "challenge_id": 0,
  "chaos_id": 0,
  "chaos_is_enabled": true,
  "comment": "string",
  "created_at": "string",
  "custom_location": [
    "string"
  ],
  "denied_value": 0,
  "email": "string",
  "error_log_limit": 0,
  "exclude_content_type": [
    "string"
  ],
  "exclude_paths": [
    "string"
  ],
  "forbidden_html_path": "string",
  "forbidden_status_code": 0,
  "gateway_timeout_html_path": "string",
  "gateway_timeout_status_code": 0,
  "health_check": true,
  "health_state": {
    "property1": {
      "error": "string",
      "state": 0
    },
    "property2": {
      "error": "string",
      "state": 0
    }
  },
  "icon": "string",
  "id": 0,
  "index": "string",
  "init": true,
  "is_enabled": true,
  "key_filename": "string",
  "load_balance": {
    "balance_type": 0
  },
  "mode": 0,
  "not_found_html_path": "string",
  "not_found_status_code": 0,
  "offline_html_path": "string",
  "offline_status_code": 0,
  "ports": [
    "string"
  ],
  "redirect_status_code": 0,
  "req_value": 0,
  "server_names": [
    "string"
  ],
  "static": true,
  "static_default": 0,
  "tamper_refresh": 0,
  "tamper_refresh_state": "string",
  "title": "string",
  "type": 0,
  "updated_at": "string",
  "upstreams": [
    "string"
  ],
  "wr_id": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|access_log_limit|integer|false|none||none|
|acl_enabled|boolean|false|none||none|
|acl_response_html_path|string|false|none||none|
|acl_response_status_code|integer|false|none||none|
|auth_defense_id|integer|false|none||none|
|bad_gateway_html_path|string|false|none||none|
|bad_gateway_status_code|integer|false|none||none|
|cc_bot|boolean|false|none||none|
|cert_filename|string|false|none||3.5.0 存储时废弃，tcd通信时仍使用|
|cert_id|integer|false|none||none|
|cert_type|integer|false|none||0 -> no cert, 1 -> upload, 2 -> self-signed, 3 -> choose mgt cert<br />CertType 3.5.0 存储时废弃|
|challenge_id|integer|false|none||none|
|chaos_id|integer|false|none||none|
|chaos_is_enabled|boolean|false|none||none|
|comment|string|false|none||none|
|created_at|string|false|none||none|
|custom_location|[string]|false|none||none|
|denied_value|integer|false|none||none|
|email|string|false|none||none|
|error_log_limit|integer|false|none||none|
|exclude_content_type|[string]|false|none||none|
|exclude_paths|[string]|false|none||none|
|forbidden_html_path|string|false|none||none|
|forbidden_status_code|integer|false|none||none|
|gateway_timeout_html_path|string|false|none||none|
|gateway_timeout_status_code|integer|false|none||none|
|health_check|boolean|false|none||none|
|health_state|object|false|none||none|
|» **additionalProperties**|[site.HealthState](#schemasite.healthstate)|false|none||none|
|icon|string|false|none||none|
|id|integer|false|none||none|
|index|string|false|none||none|
|init|boolean|false|none||none|
|is_enabled|boolean|false|none||none|
|key_filename|string|false|none||none|
|load_balance|[model.LoadBalanceConfig](#schemamodel.loadbalanceconfig)|false|none||none|
|mode|integer|false|none||0 -> defense, 1-> offline, 2 -> dry run|
|not_found_html_path|string|false|none||none|
|not_found_status_code|integer|false|none||none|
|offline_html_path|string|false|none||none|
|offline_status_code|integer|false|none||none|
|ports|[string]|false|none||none|
|redirect_status_code|integer|false|none||none|
|req_value|integer|false|none||none|
|server_names|[string]|false|none||none|
|static|boolean|false|none||none|
|static_default|integer|false|none||none|
|tamper_refresh|integer|false|none||防篡改刷新时间（毫秒）|
|tamper_refresh_state|string|false|none||none|
|title|string|false|none||none|
|type|integer|false|none||none|
|updated_at|string|false|none||none|
|upstreams|[string]|false|none||none|
|wr_id|integer|false|none||none|

<h2 id="tocS_site.GetWebsiteItem">site.GetWebsiteItem</h2>

<a id="schemasite.getwebsiteitem"></a>
<a id="schema_site.GetWebsiteItem"></a>
<a id="tocSsite.getwebsiteitem"></a>
<a id="tocssite.getwebsiteitem"></a>

```json
{
  "access_log_limit": 0,
  "acl_enabled": true,
  "acl_response_html_path": "string",
  "acl_response_status_code": 0,
  "auth_defense_id": 0,
  "bad_gateway_html_path": "string",
  "bad_gateway_status_code": 0,
  "cc_bot": true,
  "cert_filename": "string",
  "cert_id": 0,
  "cert_type": 0,
  "challenge_id": 0,
  "chaos_id": 0,
  "chaos_is_enabled": true,
  "comment": "string",
  "created_at": "string",
  "custom_location": [
    "string"
  ],
  "denied_value": 0,
  "email": "string",
  "error_log_limit": 0,
  "exclude_content_type": [
    "string"
  ],
  "exclude_paths": [
    "string"
  ],
  "forbidden_html_path": "string",
  "forbidden_status_code": 0,
  "gateway_timeout_html_path": "string",
  "gateway_timeout_status_code": 0,
  "health_check": true,
  "health_state": {
    "property1": {
      "error": "string",
      "state": 0
    },
    "property2": {
      "error": "string",
      "state": 0
    }
  },
  "icon": "string",
  "id": 0,
  "index": "string",
  "init": true,
  "is_enabled": true,
  "key_filename": "string",
  "load_balance": {
    "balance_type": 0
  },
  "mode": 0,
  "not_found_html_path": "string",
  "not_found_status_code": 0,
  "offline_html_path": "string",
  "offline_status_code": 0,
  "ports": [
    "string"
  ],
  "redirect_status_code": 0,
  "req_value": 0,
  "server_names": [
    "string"
  ],
  "static": true,
  "static_default": 0,
  "tamper_refresh": 0,
  "tamper_refresh_state": "string",
  "title": "string",
  "type": 0,
  "updated_at": "string",
  "upstreams": [
    "string"
  ],
  "wr_id": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|access_log_limit|integer|false|none||none|
|acl_enabled|boolean|false|none||none|
|acl_response_html_path|string|false|none||none|
|acl_response_status_code|integer|false|none||none|
|auth_defense_id|integer|false|none||none|
|bad_gateway_html_path|string|false|none||none|
|bad_gateway_status_code|integer|false|none||none|
|cc_bot|boolean|false|none||none|
|cert_filename|string|false|none||3.5.0 存储时废弃，tcd通信时仍使用|
|cert_id|integer|false|none||none|
|cert_type|integer|false|none||0 -> no cert, 1 -> upload, 2 -> self-signed, 3 -> choose mgt cert<br />CertType 3.5.0 存储时废弃|
|challenge_id|integer|false|none||none|
|chaos_id|integer|false|none||none|
|chaos_is_enabled|boolean|false|none||none|
|comment|string|false|none||none|
|created_at|string|false|none||none|
|custom_location|[string]|false|none||none|
|denied_value|integer|false|none||none|
|email|string|false|none||none|
|error_log_limit|integer|false|none||none|
|exclude_content_type|[string]|false|none||none|
|exclude_paths|[string]|false|none||none|
|forbidden_html_path|string|false|none||none|
|forbidden_status_code|integer|false|none||none|
|gateway_timeout_html_path|string|false|none||none|
|gateway_timeout_status_code|integer|false|none||none|
|health_check|boolean|false|none||none|
|health_state|object|false|none||none|
|» **additionalProperties**|[site.HealthState](#schemasite.healthstate)|false|none||none|
|icon|string|false|none||none|
|id|integer|false|none||none|
|index|string|false|none||none|
|init|boolean|false|none||none|
|is_enabled|boolean|false|none||none|
|key_filename|string|false|none||none|
|load_balance|[model.LoadBalanceConfig](#schemamodel.loadbalanceconfig)|false|none||none|
|mode|integer|false|none||0 -> defense, 1-> offline, 2 -> dry run|
|not_found_html_path|string|false|none||none|
|not_found_status_code|integer|false|none||none|
|offline_html_path|string|false|none||none|
|offline_status_code|integer|false|none||none|
|ports|[string]|false|none||none|
|redirect_status_code|integer|false|none||none|
|req_value|integer|false|none||none|
|server_names|[string]|false|none||none|
|static|boolean|false|none||none|
|static_default|integer|false|none||none|
|tamper_refresh|integer|false|none||防篡改刷新时间（毫秒）|
|tamper_refresh_state|string|false|none||none|
|title|string|false|none||none|
|type|integer|false|none||none|
|updated_at|string|false|none||none|
|upstreams|[string]|false|none||none|
|wr_id|integer|false|none||none|

<h2 id="tocS_site.GetWebsiteRes">site.GetWebsiteRes</h2>

<a id="schemasite.getwebsiteres"></a>
<a id="schema_site.GetWebsiteRes"></a>
<a id="tocSsite.getwebsiteres"></a>
<a id="tocssite.getwebsiteres"></a>

```json
{
  "data": [
    {
      "access_log_limit": 0,
      "acl_enabled": true,
      "acl_response_html_path": "string",
      "acl_response_status_code": 0,
      "auth_defense_id": 0,
      "bad_gateway_html_path": "string",
      "bad_gateway_status_code": 0,
      "cc_bot": true,
      "cert_filename": "string",
      "cert_id": 0,
      "cert_type": 0,
      "challenge_id": 0,
      "chaos_id": 0,
      "chaos_is_enabled": true,
      "comment": "string",
      "created_at": "string",
      "custom_location": [
        "string"
      ],
      "denied_value": 0,
      "email": "string",
      "error_log_limit": 0,
      "exclude_content_type": [
        "string"
      ],
      "exclude_paths": [
        "string"
      ],
      "forbidden_html_path": "string",
      "forbidden_status_code": 0,
      "gateway_timeout_html_path": "string",
      "gateway_timeout_status_code": 0,
      "health_check": true,
      "health_state": {
        "property1": {
          "error": "string",
          "state": 0
        },
        "property2": {
          "error": "string",
          "state": 0
        }
      },
      "icon": "string",
      "id": 0,
      "index": "string",
      "init": true,
      "is_enabled": true,
      "key_filename": "string",
      "load_balance": {
        "balance_type": 0
      },
      "mode": 0,
      "not_found_html_path": "string",
      "not_found_status_code": 0,
      "offline_html_path": "string",
      "offline_status_code": 0,
      "ports": [
        "string"
      ],
      "redirect_status_code": 0,
      "req_value": 0,
      "server_names": [
        "string"
      ],
      "static": true,
      "static_default": 0,
      "tamper_refresh": 0,
      "tamper_refresh_state": "string",
      "title": "string",
      "type": 0,
      "updated_at": "string",
      "upstreams": [
        "string"
      ],
      "wr_id": 0
    }
  ],
  "total": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|data|[[site.GetWebsiteItem](#schemasite.getwebsiteitem)]|false|none||none|
|total|integer|false|none||none|

<h2 id="tocS_site.HealthState">site.HealthState</h2>

<a id="schemasite.healthstate"></a>
<a id="schema_site.HealthState"></a>
<a id="tocSsite.healthstate"></a>
<a id="tocssite.healthstate"></a>

```json
{
  "error": "string",
  "state": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|error|string|false|none||none|
|state|integer|false|none||none|

<h2 id="tocS_site.ListLogItem">site.ListLogItem</h2>

<a id="schemasite.listlogitem"></a>
<a id="schema_site.ListLogItem"></a>
<a id="tocSsite.listlogitem"></a>
<a id="tocssite.listlogitem"></a>

```json
{
  "filename": "string",
  "size": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|filename|string|false|none||none|
|size|integer|false|none||none|

<h2 id="tocS_site.NginxConfigGetRes">site.NginxConfigGetRes</h2>

<a id="schemasite.nginxconfiggetres"></a>
<a id="schema_site.NginxConfigGetRes"></a>
<a id="tocSsite.nginxconfiggetres"></a>
<a id="tocssite.nginxconfiggetres"></a>

```json
{
  "config": "string",
  "custom_location": [
    "string"
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|config|string|false|none||none|
|custom_location|[string]|false|none||none|

<h2 id="tocS_site.NginxConfigUpdateReq">site.NginxConfigUpdateReq</h2>

<a id="schemasite.nginxconfigupdatereq"></a>
<a id="schema_site.NginxConfigUpdateReq"></a>
<a id="tocSsite.nginxconfigupdatereq"></a>
<a id="tocssite.nginxconfigupdatereq"></a>

```json
{
  "custom_location": [
    "string"
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|custom_location|[string]|false|none||none|

<h2 id="tocS_site.PostWebsiteHealthcheckReq">site.PostWebsiteHealthcheckReq</h2>

<a id="schemasite.postwebsitehealthcheckreq"></a>
<a id="schema_site.PostWebsiteHealthcheckReq"></a>
<a id="tocSsite.postwebsitehealthcheckreq"></a>
<a id="tocssite.postwebsitehealthcheckreq"></a>

```json
{
  "hosts": [
    "string"
  ],
  "upstreams": [
    "string"
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|hosts|[string]|false|none||none|
|upstreams|[string]|false|none||none|

<h2 id="tocS_site.PubWebsiteChallengeReq">site.PubWebsiteChallengeReq</h2>

<a id="schemasite.pubwebsitechallengereq"></a>
<a id="schema_site.PubWebsiteChallengeReq"></a>
<a id="tocSsite.pubwebsitechallengereq"></a>
<a id="tocssite.pubwebsitechallengereq"></a>

```json
{
  "enable": true,
  "expire": 0,
  "id": 0,
  "level": 0,
  "replay": true
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|enable|boolean|false|none||none|
|expire|integer|false|none||none|
|id|integer|false|none||none|
|level|integer|false|none||none|
|replay|boolean|false|none||none|

<h2 id="tocS_site.PutWebsiteDefenseReq">site.PutWebsiteDefenseReq</h2>

<a id="schemasite.putwebsitedefensereq"></a>
<a id="schema_site.PutWebsiteDefenseReq"></a>
<a id="tocSsite.putwebsitedefensereq"></a>
<a id="tocssite.putwebsitedefensereq"></a>

```json
{
  "auth_source_ids": [
    0
  ],
  "enable": true,
  "id": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|auth_source_ids|[integer]|false|none||none|
|enable|boolean|false|none||none|
|id|integer|false|none||none|

<h2 id="tocS_site.PutWebsiteModeRequest">site.PutWebsiteModeRequest</h2>

<a id="schemasite.putwebsitemoderequest"></a>
<a id="schema_site.PutWebsiteModeRequest"></a>
<a id="tocSsite.putwebsitemoderequest"></a>
<a id="tocssite.putwebsitemoderequest"></a>

```json
{
  "ids": [
    0
  ],
  "mode": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|ids|[integer]|false|none||none|
|mode|integer|false|none||none|

<h2 id="tocS_site.RenameStaticReq">site.RenameStaticReq</h2>

<a id="schemasite.renamestaticreq"></a>
<a id="schema_site.RenameStaticReq"></a>
<a id="tocSsite.renamestaticreq"></a>
<a id="tocssite.renamestaticreq"></a>

```json
{
  "copy": true,
  "new_path": "string",
  "old_path": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|copy|boolean|false|none||none|
|new_path|string|true|none||none|
|old_path|string|true|none||none|

<h2 id="tocS_site.SetWebsiteWaitingRoomReq">site.SetWebsiteWaitingRoomReq</h2>

<a id="schemasite.setwebsitewaitingroomreq"></a>
<a id="schema_site.SetWebsiteWaitingRoomReq"></a>
<a id="tocSsite.setwebsitewaitingroomreq"></a>
<a id="tocssite.setwebsitewaitingroomreq"></a>

```json
{
  "is_enabled": true,
  "max_concurrent": 0,
  "session_timeout": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|is_enabled|boolean|false|none||none|
|max_concurrent|integer|false|none||当前允许最大同时在线的人数|
|session_timeout|integer|false|none||服务队列中 session 的存活周期|

<h2 id="tocS_site.WaitingRoomLog">site.WaitingRoomLog</h2>

<a id="schemasite.waitingroomlog"></a>
<a id="schema_site.WaitingRoomLog"></a>
<a id="tocSsite.waitingroomlog"></a>
<a id="tocssite.waitingroomlog"></a>

```json
{
  "avg_wait_sec": 0,
  "bounce_rate": 0,
  "cur_waiting": 0,
  "dur_sec": 0,
  "ended_at": 0,
  "max_concurrent": 0,
  "rule_id": 0,
  "site_comment": "string",
  "site_icon": "string",
  "site_id": 0,
  "site_server_names": [
    "string"
  ],
  "site_title": "string",
  "started_at": 0,
  "top_waiting": 0,
  "total_waiting": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|avg_wait_sec|integer|false|none||none|
|bounce_rate|number|false|none||none|
|cur_waiting|integer|false|none||none|
|dur_sec|integer|false|none||none|
|ended_at|integer|false|none||none|
|max_concurrent|integer|false|none||none|
|rule_id|integer|false|none||none|
|site_comment|string|false|none||none|
|site_icon|string|false|none||none|
|site_id|integer|false|none||none|
|site_server_names|[string]|false|none||none|
|site_title|string|false|none||none|
|started_at|integer|false|none||none|
|top_waiting|integer|false|none||none|
|total_waiting|integer|false|none||none|

<h2 id="tocS_site.WaitingRoomLogs">site.WaitingRoomLogs</h2>

<a id="schemasite.waitingroomlogs"></a>
<a id="schema_site.WaitingRoomLogs"></a>
<a id="tocSsite.waitingroomlogs"></a>
<a id="tocssite.waitingroomlogs"></a>

```json
{
  "data": [
    {
      "avg_wait_sec": 0,
      "bounce_rate": 0,
      "cur_waiting": 0,
      "dur_sec": 0,
      "ended_at": 0,
      "max_concurrent": 0,
      "rule_id": 0,
      "site_comment": "string",
      "site_icon": "string",
      "site_id": 0,
      "site_server_names": [
        "string"
      ],
      "site_title": "string",
      "started_at": 0,
      "top_waiting": 0,
      "total_waiting": 0
    }
  ],
  "total": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|data|[[site.WaitingRoomLog](#schemasite.waitingroomlog)]|false|none||none|
|total|integer|false|none||none|

<h2 id="tocS_site.WebsiteChaosReq">site.WebsiteChaosReq</h2>

<a id="schemasite.websitechaosreq"></a>
<a id="schema_site.WebsiteChaosReq"></a>
<a id="tocSsite.websitechaosreq"></a>
<a id="tocssite.websitechaosreq"></a>

```json
{
  "html_encryption": true,
  "html_fast_decryption": true,
  "img_encryption": true,
  "img_text": "string",
  "img_watermark": "string",
  "is_enabled": true,
  "js_encryption": true,
  "js_path": [
    "string"
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|html_encryption|boolean|false|none||none|
|html_fast_decryption|boolean|false|none||none|
|img_encryption|boolean|false|none||none|
|img_text|string|false|none||none|
|img_watermark|string|false|none||none|
|is_enabled|boolean|false|none||none|
|js_encryption|boolean|false|none||none|
|js_path|[string]|false|none||none|

<h2 id="tocS_site.WebsiteReq">site.WebsiteReq</h2>

<a id="schemasite.websitereq"></a>
<a id="schema_site.WebsiteReq"></a>
<a id="tocSsite.websitereq"></a>
<a id="tocssite.websitereq"></a>

```json
{
  "cert_id": 0,
  "comment": "string",
  "email": "string",
  "health_check": true,
  "id": 0,
  "index": "string",
  "load_balance": {
    "balance_type": 0
  },
  "ports": [
    "string"
  ],
  "redirect_status_code": 0,
  "server_names": [
    "string"
  ],
  "static_default": 0,
  "type": 0,
  "upstreams": [
    "string"
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|cert_id|integer|false|none||none|
|comment|string|false|none||none|
|email|string|false|none||none|
|health_check|boolean|false|none||none|
|id|integer|false|none||none|
|index|string|false|none||none|
|load_balance|[model.LoadBalanceConfig](#schemamodel.loadbalanceconfig)|false|none||none|
|ports|[string]|false|none||none|
|redirect_status_code|integer|false|none||none|
|server_names|[string]|false|none||none|
|static_default|integer|false|none||none|
|type|integer|false|none||none|
|upstreams|[string]|false|none||none|

<h2 id="tocS_stat.AdvanceAccessRes">stat.AdvanceAccessRes</h2>

<a id="schemastat.advanceaccessres"></a>
<a id="schema_stat.AdvanceAccessRes"></a>
<a id="tocSstat.advanceaccessres"></a>
<a id="tocsstat.advanceaccessres"></a>

```json
{
  "access": 0,
  "ip": 0,
  "session": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|access|integer|false|none||none|
|ip|integer|false|none||none|
|session|integer|false|none||none|

<h2 id="tocS_stat.AdvanceAttackRes">stat.AdvanceAttackRes</h2>

<a id="schemastat.advanceattackres"></a>
<a id="schema_stat.AdvanceAttackRes"></a>
<a id="tocSstat.advanceattackres"></a>
<a id="tocsstat.advanceattackres"></a>

```json
{
  "attack_ip": 0,
  "intercept": {
    "auth_defense": 0,
    "block": 0,
    "challenge": 0,
    "offline": 0,
    "rate_limit": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|attack_ip|integer|false|none||none|
|intercept|object|false|none||none|
|» auth_defense|integer|false|none||none|
|» block|integer|false|none||none|
|» challenge|integer|false|none||none|
|» offline|integer|false|none||none|
|» rate_limit|integer|false|none||none|

<h2 id="tocS_stat.AdvanceClientRes">stat.AdvanceClientRes</h2>

<a id="schemastat.advanceclientres"></a>
<a id="schema_stat.AdvanceClientRes"></a>
<a id="tocSstat.advanceclientres"></a>
<a id="tocsstat.advanceclientres"></a>

```json
{
  "browser": [
    {
      "browser": "string",
      "count": 0
    }
  ],
  "os": [
    {
      "count": 0,
      "os": "string"
    }
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|browser|[object]|false|none||none|
|» browser|string|false|none||none|
|» count|integer|false|none||none|
|os|[object]|false|none||none|
|» count|integer|false|none||none|
|» os|string|false|none||none|

<h2 id="tocS_stat.AdvanceErrorStatusCodeRes">stat.AdvanceErrorStatusCodeRes</h2>

<a id="schemastat.advanceerrorstatuscoderes"></a>
<a id="schema_stat.AdvanceErrorStatusCodeRes"></a>
<a id="tocSstat.advanceerrorstatuscoderes"></a>
<a id="tocsstat.advanceerrorstatuscoderes"></a>

```json
{
  "error_4xx": 0,
  "error_5xx": 0,
  "total": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|error_4xx|integer|false|none||none|
|error_5xx|integer|false|none||none|
|total|integer|false|none||none|

<h2 id="tocS_stat.BasicAccessRes">stat.BasicAccessRes</h2>

<a id="schemastat.basicaccessres"></a>
<a id="schema_stat.BasicAccessRes"></a>
<a id="tocSstat.basicaccessres"></a>
<a id="tocsstat.basicaccessres"></a>

```json
{
  "access": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|access|integer|false|none||none|

<h2 id="tocS_stat.BasicAttackRes">stat.BasicAttackRes</h2>

<a id="schemastat.basicattackres"></a>
<a id="schema_stat.BasicAttackRes"></a>
<a id="tocSstat.basicattackres"></a>
<a id="tocsstat.basicattackres"></a>

```json
{
  "attack_ip": 0,
  "intercept": {
    "auth_defense": 0,
    "block": 0,
    "challenge": 0,
    "offline": 0,
    "rate_limit": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|attack_ip|integer|false|none||none|
|intercept|object|false|none||none|
|» auth_defense|integer|false|none||none|
|» block|integer|false|none||none|
|» challenge|integer|false|none||none|
|» offline|integer|false|none||none|
|» rate_limit|integer|false|none||none|

<h2 id="tocS_stat.BasicErrorStatusCodeRes">stat.BasicErrorStatusCodeRes</h2>

<a id="schemastat.basicerrorstatuscoderes"></a>
<a id="schema_stat.BasicErrorStatusCodeRes"></a>
<a id="tocSstat.basicerrorstatuscoderes"></a>
<a id="tocsstat.basicerrorstatuscoderes"></a>

```json
{
  "error_4xx": 0,
  "error_5xx": 0,
  "total": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|error_4xx|integer|false|none||none|
|error_5xx|integer|false|none||none|
|total|integer|false|none||none|

<h2 id="tocS_system.AboutLicense">system.AboutLicense</h2>

<a id="schemasystem.aboutlicense"></a>
<a id="schema_system.AboutLicense"></a>
<a id="tocSsystem.aboutlicense"></a>
<a id="tocssystem.aboutlicense"></a>

```json
{
  "valid": true
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|valid|boolean|false|none||none|

<h2 id="tocS_system.AboutRes">system.AboutRes</h2>

<a id="schemasystem.aboutres"></a>
<a id="schema_system.AboutRes"></a>
<a id="tocSsystem.aboutres"></a>
<a id="tocssystem.aboutres"></a>

```json
{
  "cert_id": 0,
  "deprecated": true,
  "license": {
    "valid": true
  },
  "machine_id": "string",
  "outdated": true,
  "oversea": true,
  "password_expire_day": 0,
  "slave": true,
  "staging": true,
  "time": "string",
  "version": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|cert_id|integer|false|none||none|
|deprecated|boolean|false|none||none|
|license|[system.AboutLicense](#schemasystem.aboutlicense)|false|none||none|
|machine_id|string|false|none||none|
|outdated|boolean|false|none||none|
|oversea|boolean|false|none||none|
|password_expire_day|integer|false|none||none|
|slave|boolean|false|none||none|
|staging|boolean|false|none||none|
|time|string|false|none||none|
|version|string|false|none||none|

<h2 id="tocS_system.CodeApplyInfoRes">system.CodeApplyInfoRes</h2>

<a id="schemasystem.codeapplyinfores"></a>
<a id="schema_system.CodeApplyInfoRes"></a>
<a id="tocSsystem.codeapplyinfores"></a>
<a id="tocssystem.codeapplyinfores"></a>

```json
{
  "expired_at": 0,
  "org_id": "string",
  "org_name": "string",
  "purchased": true,
  "pwd_updated_at": 0,
  "river_url": "string",
  "role": 0,
  "state": "string",
  "timeout": true,
  "user_id": 0,
  "version": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|expired_at|integer|false|none||none|
|org_id|string|false|none||none|
|org_name|string|false|none||none|
|purchased|boolean|false|none||none|
|pwd_updated_at|integer|false|none||none|
|river_url|string|false|none||none|
|role|[consts.UserRole](#schemaconsts.userrole)|false|none||none|
|state|string|false|none||none|
|timeout|boolean|false|none||none|
|user_id|integer|false|none||none|
|version|[river.Edition](#schemariver.edition)|false|none||none|

<h2 id="tocS_system.CodeApplyReq">system.CodeApplyReq</h2>

<a id="schemasystem.codeapplyreq"></a>
<a id="schema_system.CodeApplyReq"></a>
<a id="tocSsystem.codeapplyreq"></a>
<a id="tocssystem.codeapplyreq"></a>

```json
{
  "code": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|string|false|none||none|

<h2 id="tocS_system.UpdateReq">system.UpdateReq</h2>

<a id="schemasystem.updatereq"></a>
<a id="schema_system.UpdateReq"></a>
<a id="tocSsystem.updatereq"></a>
<a id="tocssystem.updatereq"></a>

```json
{
  "cert_id": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|cert_id|integer|false|none||none|

<h2 id="tocS_tcd.FileInfo">tcd.FileInfo</h2>

<a id="schematcd.fileinfo"></a>
<a id="schema_tcd.FileInfo"></a>
<a id="tocStcd.fileinfo"></a>
<a id="tocstcd.fileinfo"></a>

```json
{
  "content": "string",
  "content_type": "string",
  "dir": true,
  "modify_time": 0,
  "name": "string",
  "size": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|content|string|false|none||none|
|content_type|string|false|none||none|
|dir|boolean|false|none||none|
|modify_time|integer|false|none||none|
|name|string|false|none||none|
|size|integer|false|none||none|

<h2 id="tocS_user.CreateUserReq">user.CreateUserReq</h2>

<a id="schemauser.createuserreq"></a>
<a id="schema_user.CreateUserReq"></a>
<a id="tocSuser.createuserreq"></a>
<a id="tocsuser.createuserreq"></a>

```json
{
  "password": "string",
  "role": 0,
  "tfa_enabled": true,
  "username": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|password|string|true|none||none|
|role|[consts.UserRole](#schemaconsts.userrole)|true|none||none|
|tfa_enabled|boolean|false|none||none|
|username|string|true|none||none|

<h2 id="tocS_user.CreateUserResp">user.CreateUserResp</h2>

<a id="schemauser.createuserresp"></a>
<a id="schema_user.CreateUserResp"></a>
<a id="tocSuser.createuserresp"></a>
<a id="tocsuser.createuserresp"></a>

```json
{
  "id": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer|false|none||none|

<h2 id="tocS_user.DeleteUserReq">user.DeleteUserReq</h2>

<a id="schemauser.deleteuserreq"></a>
<a id="schema_user.DeleteUserReq"></a>
<a id="tocSuser.deleteuserreq"></a>
<a id="tocsuser.deleteuserreq"></a>

```json
{
  "id": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer|false|none||none|

<h2 id="tocS_user.GetUserListRes">user.GetUserListRes</h2>

<a id="schemauser.getuserlistres"></a>
<a id="schema_user.GetUserListRes"></a>
<a id="tocSuser.getuserlistres"></a>
<a id="tocsuser.getuserlistres"></a>

```json
{
  "data": [
    {
      "id": 0,
      "last_login": 0,
      "password_enabled": true,
      "pwd_updated_at": 0,
      "role": 0,
      "tfa_binded": true,
      "tfa_enabled": true,
      "username": "string"
    }
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|data|[[user.User](#schemauser.user)]|false|none||none|

<h2 id="tocS_user.UpdateUserReq">user.UpdateUserReq</h2>

<a id="schemauser.updateuserreq"></a>
<a id="schema_user.UpdateUserReq"></a>
<a id="tocSuser.updateuserreq"></a>
<a id="tocsuser.updateuserreq"></a>

```json
{
  "id": 0,
  "password": "string",
  "role": 0,
  "tfa_enabled": true,
  "username": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer|false|none||none|
|password|string|false|none||none|
|role|[consts.UserRole](#schemaconsts.userrole)|false|none||none|
|tfa_enabled|boolean|false|none||none|
|username|string|false|none||none|

<h2 id="tocS_user.User">user.User</h2>

<a id="schemauser.user"></a>
<a id="schema_user.User"></a>
<a id="tocSuser.user"></a>
<a id="tocsuser.user"></a>

```json
{
  "id": 0,
  "last_login": 0,
  "password_enabled": true,
  "pwd_updated_at": 0,
  "role": 0,
  "tfa_binded": true,
  "tfa_enabled": true,
  "username": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer|false|none||none|
|last_login|integer|false|none||none|
|password_enabled|boolean|false|none||none|
|pwd_updated_at|integer|false|none||none|
|role|[consts.UserRole](#schemaconsts.userrole)|false|none||none|
|tfa_binded|boolean|false|none||none|
|tfa_enabled|boolean|false|none||none|
|username|string|false|none||none|

<h2 id="tocS_webhook.DingTalkConfig">webhook.DingTalkConfig</h2>

<a id="schemawebhook.dingtalkconfig"></a>
<a id="schema_webhook.DingTalkConfig"></a>
<a id="tocSwebhook.dingtalkconfig"></a>
<a id="tocswebhook.dingtalkconfig"></a>

```json
{
  "sign": "string",
  "url": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|sign|string|false|none||none|
|url|string|false|none||none|

<h2 id="tocS_webhook.DiscordConfig">webhook.DiscordConfig</h2>

<a id="schemawebhook.discordconfig"></a>
<a id="schema_webhook.DiscordConfig"></a>
<a id="tocSwebhook.discordconfig"></a>
<a id="tocswebhook.discordconfig"></a>

```json
{
  "url": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|url|string|false|none||none|

<h2 id="tocS_webhook.FlyBookConfig">webhook.FlyBookConfig</h2>

<a id="schemawebhook.flybookconfig"></a>
<a id="schema_webhook.FlyBookConfig"></a>
<a id="tocSwebhook.flybookconfig"></a>
<a id="tocswebhook.flybookconfig"></a>

```json
{
  "sign": "string",
  "url": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|sign|string|false|none||none|
|url|string|false|none||none|

<h2 id="tocS_webhook.QiyeWeixinConfig">webhook.QiyeWeixinConfig</h2>

<a id="schemawebhook.qiyeweixinconfig"></a>
<a id="schema_webhook.QiyeWeixinConfig"></a>
<a id="tocSwebhook.qiyeweixinconfig"></a>
<a id="tocswebhook.qiyeweixinconfig"></a>

```json
{
  "url": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|url|string|false|none||none|

<h2 id="tocS_webhook.TelegramConfig">webhook.TelegramConfig</h2>

<a id="schemawebhook.telegramconfig"></a>
<a id="schema_webhook.TelegramConfig"></a>
<a id="tocSwebhook.telegramconfig"></a>
<a id="tocswebhook.telegramconfig"></a>

```json
{
  "chat_id": 0,
  "token": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|chat_id|integer|false|none||none|
|token|string|false|none||none|

<h2 id="tocS_webhook.WebhookConfig">webhook.WebhookConfig</h2>

<a id="schemawebhook.webhookconfig"></a>
<a id="schema_webhook.WebhookConfig"></a>
<a id="tocSwebhook.webhookconfig"></a>
<a id="tocswebhook.webhookconfig"></a>

```json
{
  "acl_request_enable": true,
  "attack_enable": true,
  "ding_talk": {
    "sign": "string",
    "url": "string"
  },
  "discord": {
    "url": "string"
  },
  "enable": true,
  "fly_book": {
    "sign": "string",
    "url": "string"
  },
  "qiye_weixin": {
    "url": "string"
  },
  "telegram": {
    "chat_id": 0,
    "token": "string"
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|acl_request_enable|boolean|false|none||none|
|attack_enable|boolean|false|none||none|
|ding_talk|[webhook.DingTalkConfig](#schemawebhook.dingtalkconfig)|false|none||none|
|discord|[webhook.DiscordConfig](#schemawebhook.discordconfig)|false|none||none|
|enable|boolean|false|none||none|
|fly_book|[webhook.FlyBookConfig](#schemawebhook.flybookconfig)|false|none||none|
|qiye_weixin|[webhook.QiyeWeixinConfig](#schemawebhook.qiyeweixinconfig)|false|none||none|
|telegram|[webhook.TelegramConfig](#schemawebhook.telegramconfig)|false|none||none|

