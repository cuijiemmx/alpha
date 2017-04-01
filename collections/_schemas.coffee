@Schemas = {}

# Non collection Schemas
Schemas.updatePassword = new SimpleSchema
  old:
    type: String
    label: "当前密码"
    max: 50

  new:
    type: String
    min: 6
    max: 20
    label: "新密码"

  confirm:
    type: String
    min: 6
    max: 20
    label: "再次输入新密码"
