-- Generated by protobuf; do not edit
local module = {}
local protobuf = require 'protobuf'

local imports = {}
imports['qlua/rpc/qlua_structures_pb'] = require 'qlua/rpc/qlua_structures_pb'

module.REQUEST = protobuf.Descriptor()
module.REQUEST_FIRMID_FIELD = protobuf.FieldDescriptor()
module.REQUEST_CLIENT_CODE_FIELD = protobuf.FieldDescriptor()
module.REQUEST_TAG_FIELD = protobuf.FieldDescriptor()
module.REQUEST_CURRCODE_FIELD = protobuf.FieldDescriptor()
module.REQUEST_LIMIT_KIND_FIELD = protobuf.FieldDescriptor()
module.RESULT = protobuf.Descriptor()
module.RESULT_MONEY_EX_FIELD = protobuf.FieldDescriptor()

module.REQUEST_FIRMID_FIELD.name = 'firmid'
module.REQUEST_FIRMID_FIELD.full_name = '.qlua.rpc.getMoneyEx.Request.firmid'
module.REQUEST_FIRMID_FIELD.number = 1
module.REQUEST_FIRMID_FIELD.index = 0
module.REQUEST_FIRMID_FIELD.label = 1
module.REQUEST_FIRMID_FIELD.has_default_value = false
module.REQUEST_FIRMID_FIELD.default_value = ''
module.REQUEST_FIRMID_FIELD.type = 9
module.REQUEST_FIRMID_FIELD.cpp_type = 9

module.REQUEST_CLIENT_CODE_FIELD.name = 'client_code'
module.REQUEST_CLIENT_CODE_FIELD.full_name = '.qlua.rpc.getMoneyEx.Request.client_code'
module.REQUEST_CLIENT_CODE_FIELD.number = 2
module.REQUEST_CLIENT_CODE_FIELD.index = 1
module.REQUEST_CLIENT_CODE_FIELD.label = 1
module.REQUEST_CLIENT_CODE_FIELD.has_default_value = false
module.REQUEST_CLIENT_CODE_FIELD.default_value = ''
module.REQUEST_CLIENT_CODE_FIELD.type = 9
module.REQUEST_CLIENT_CODE_FIELD.cpp_type = 9

module.REQUEST_TAG_FIELD.name = 'tag'
module.REQUEST_TAG_FIELD.full_name = '.qlua.rpc.getMoneyEx.Request.tag'
module.REQUEST_TAG_FIELD.number = 3
module.REQUEST_TAG_FIELD.index = 2
module.REQUEST_TAG_FIELD.label = 1
module.REQUEST_TAG_FIELD.has_default_value = false
module.REQUEST_TAG_FIELD.default_value = ''
module.REQUEST_TAG_FIELD.type = 9
module.REQUEST_TAG_FIELD.cpp_type = 9

module.REQUEST_CURRCODE_FIELD.name = 'currcode'
module.REQUEST_CURRCODE_FIELD.full_name = '.qlua.rpc.getMoneyEx.Request.currcode'
module.REQUEST_CURRCODE_FIELD.number = 4
module.REQUEST_CURRCODE_FIELD.index = 3
module.REQUEST_CURRCODE_FIELD.label = 1
module.REQUEST_CURRCODE_FIELD.has_default_value = false
module.REQUEST_CURRCODE_FIELD.default_value = ''
module.REQUEST_CURRCODE_FIELD.type = 9
module.REQUEST_CURRCODE_FIELD.cpp_type = 9

module.REQUEST_LIMIT_KIND_FIELD.name = 'limit_kind'
module.REQUEST_LIMIT_KIND_FIELD.full_name = '.qlua.rpc.getMoneyEx.Request.limit_kind'
module.REQUEST_LIMIT_KIND_FIELD.number = 5
module.REQUEST_LIMIT_KIND_FIELD.index = 4
module.REQUEST_LIMIT_KIND_FIELD.label = 1
module.REQUEST_LIMIT_KIND_FIELD.has_default_value = false
module.REQUEST_LIMIT_KIND_FIELD.default_value = 0
module.REQUEST_LIMIT_KIND_FIELD.type = 5
module.REQUEST_LIMIT_KIND_FIELD.cpp_type = 1

module.REQUEST.name = 'Request'
module.REQUEST.full_name = '.qlua.rpc.getMoneyEx.Request'
module.REQUEST.nested_types = {}
module.REQUEST.enum_types = {}
module.REQUEST.fields = {module.REQUEST_FIRMID_FIELD, module.REQUEST_CLIENT_CODE_FIELD, module.REQUEST_TAG_FIELD, module.REQUEST_CURRCODE_FIELD, module.REQUEST_LIMIT_KIND_FIELD}
module.REQUEST.is_extendable = false
module.REQUEST.extensions = {}
module.RESULT_MONEY_EX_FIELD.name = 'money_ex'
module.RESULT_MONEY_EX_FIELD.full_name = '.qlua.rpc.getMoneyEx.Result.money_ex'
module.RESULT_MONEY_EX_FIELD.number = 1
module.RESULT_MONEY_EX_FIELD.index = 0
module.RESULT_MONEY_EX_FIELD.label = 1
module.RESULT_MONEY_EX_FIELD.has_default_value = false
module.RESULT_MONEY_EX_FIELD.default_value = nil
module.RESULT_MONEY_EX_FIELD.message_type = imports['qlua/rpc/qlua_structures_pb'].MONEYLIMIT
module.RESULT_MONEY_EX_FIELD.type = 11
module.RESULT_MONEY_EX_FIELD.cpp_type = 10

module.RESULT.name = 'Result'
module.RESULT.full_name = '.qlua.rpc.getMoneyEx.Result'
module.RESULT.nested_types = {}
module.RESULT.enum_types = {}
module.RESULT.fields = {module.RESULT_MONEY_EX_FIELD}
module.RESULT.is_extendable = false
module.RESULT.extensions = {}

module.Request = protobuf.Message(module.REQUEST)
module.Result = protobuf.Message(module.RESULT)


module.MESSAGE_TYPES = {'Request','Result'}
module.ENUM_TYPES = {}

return module
