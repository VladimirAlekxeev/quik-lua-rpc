local qlua_rpc = require("quik-lua-rpc.messages.qlua_rpc_pb")
local qlua_structs = require("quik-lua-rpc.messages.qlua_structures_pb")

local uuid = require("quik-lua-rpc.utils.uuid")
assert(uuid ~= nil, "quik-lua-rpc.utils.uuid lib is missing.")
local zmq = require("lzmq.ffi")

local inspect = require("inspect")
assert(inspect ~= nil, "inspect lib is missing.")

local ctx = zmq.context()

local Client = {
  
  socket = ctx:socket(zmq.REQ)
}

function Client:init(socket_addr)
  
  self.socket:connect(socket_addr)
end

function Client:start()

  local request = qlua_rpc.Qlua_Request()
  
  request.type = qlua_rpc.ProcedureType.GET_MONEY

  local args = qlua_rpc.GetMoney_Request()

  --args.chart_tag = "TEST"
  --args.label_id = 4
  --[[
  local p1 = qlua_rpc.AddLabel_Request.LabelParamsEntry()
  p1.key = "TEXT"
  p1.value = "sample_text"
  
  local p2 = qlua_rpc.AddLabel_Request.LabelParamsEntry()
  p2.key = "IMAGE_PATH"
  p2.value = ""
  
  local p3 = qlua_rpc.AddLabel_Request.LabelParamsEntry()
  p3.key = "ALIGNMENT"
  p3.value = "TOP"
  
  local p4 = qlua_rpc.AddLabel_Request.LabelParamsEntry()
  p4.key = "YVALUE"
  p4.value = "1000"
  
  local p5 = qlua_rpc.AddLabel_Request.LabelParamsEntry()
  p5.key = "DATE"
  p5.value = "20160701"
  
  local p6 = qlua_rpc.AddLabel_Request.LabelParamsEntry()
  p6.key = "TIME"
  p6.value = "113000"
  
  local p7 = qlua_rpc.AddLabel_Request.LabelParamsEntry()
  p7.key = "R"
  p7.value = "0"
  
  local p8 = qlua_rpc.AddLabel_Request.LabelParamsEntry()
  p8.key = "G"
  p8.value = "255"
  
  local p9 = qlua_rpc.AddLabel_Request.LabelParamsEntry()
  p9.key = "B"
  p9.value = "0"
  
  local p10 = qlua_rpc.AddLabel_Request.LabelParamsEntry()
  p10.key = "TRANSPARENCY"
  p10.value = "0"
  
  local p11 = qlua_rpc.AddLabel_Request.LabelParamsEntry()
  p11.key = "TRANSPARENCY_BACKGROUND"
  p11.value = "0"
  
  local p12 = qlua_rpc.AddLabel_Request.LabelParamsEntry()
  p12.key = "FONT_FACE_NAME"
  p12.value = "Verdana"
  
  local p13 = qlua_rpc.AddLabel_Request.LabelParamsEntry()
  p13.key = "FONT_HEIGHT"
  p13.value = "20"
  
  local p14 = qlua_rpc.AddLabel_Request.LabelParamsEntry()
  p14.key = "HINT"
  p14.value = "hint_text"
  
  table.insert(args.label_params, p1)
  table.insert(args.label_params, p2)
  table.insert(args.label_params, p3)
  table.insert(args.label_params, p4)
  table.insert(args.label_params, p5)
  table.insert(args.label_params, p6)
  table.insert(args.label_params, p7)
  table.insert(args.label_params, p8)
  table.insert(args.label_params, p9)
  table.insert(args.label_params, p10)
  table.insert(args.label_params, p11)
  table.insert(args.label_params, p12)
  table.insert(args.label_params, p13)
  table.insert(args.label_params, p14)--]]
  --[[
  local action = qlua_rpc.SendTransaction_Request.TransactionEntry()
  action.key = "ACTION"
  action.value = "NEW_STOP_ORDER"
  table.insert(args.transaction, action)
  
  local account = qlua_rpc.SendTransaction_Request.TransactionEntry()
  account.key = "ACCOUNT"
  account.value = "L01-00000F00"
  table.insert(args.transaction, account)
  
  local trans_id = qlua_rpc.SendTransaction_Request.TransactionEntry()
  trans_id.key = "TRANS_ID"
  trans_id.value = "55"
  table.insert(args.transaction, trans_id)
  
  local class_code = qlua_rpc.SendTransaction_Request.TransactionEntry()
  class_code.key = "CLASSCODE"
  class_code.value = "TQBR"
  table.insert(args.transaction, class_code)
  
  local sec_code = qlua_rpc.SendTransaction_Request.TransactionEntry()
  sec_code.key = "SECCODE"
  sec_code.value = "AFKS"
  table.insert(args.transaction, sec_code)
  
  local operation = qlua_rpc.SendTransaction_Request.TransactionEntry()
  operation.key = "OPERATION"
  operation.value = "S"
  table.insert(args.transaction, operation)
  
  local qty = qlua_rpc.SendTransaction_Request.TransactionEntry()
  qty.key = "GOGA"
  qty.value = "1"
  table.insert(args.transaction, qty)
  
  local client_code = qlua_rpc.SendTransaction_Request.TransactionEntry()
  client_code.key = "CLIENT_CODE"
  client_code.value = "55654"
  table.insert(args.transaction, client_code)
  
  local stop_price = qlua_rpc.SendTransaction_Request.TransactionEntry()
  stop_price.key = "STOPPRICE"
  stop_price.value = "25"
  table.insert(args.transaction, stop_price)
  
  local price = qlua_rpc.SendTransaction_Request.TransactionEntry()
  price.key = "PRICE"
  price.value = "25.7"
  table.insert(args.transaction, price)
  
  local exp_date = qlua_rpc.SendTransaction_Request.TransactionEntry()
  exp_date.key = "EXPIRY_DATE"
  exp_date.value = "20170925"
  table.insert(args.transaction, exp_date)
  --]]
  
  --args.table_name = "depo_limits"
  --args.start_index = 0
  --args.fn_def = "function (t) return true end"
  --args.params = "awg_position_price"
  --args.datasource_uuid = "af923482-4498-4e19-cef6-9448a8204699"
  --args.f_cb_def = "function (index, datasource) message('datasource_callback: index = '..index..'; OPEN = '..datasource:O(index))  end"
  --args.candle_index = 10
  --args.class_code = "SPBFUT"
  --args.sec_code = "RIU7"
  --args.interval = qlua_rpc.Interval.INTERVAL_M30
  --args.red = 0
  --args.green = 255
  --args.blue = 255
  --args.t_id = 1
  --args.f_cb_def = "function (t_id, msg, par1, par2) message('client_callback: '..t_id..'; '..msg..'; '..par1..'; '..par2) end"
  --args.table_id = 2
  --args.row = 2
  --args.col = -1
  --args.b_color = 0x00ffff
  --args.f_color = 0x000000 -- BGR
  --args.sel_b_color = 0xffffff
  --args.sel_f_color = 0x000000
  --args.timeout = 5000
  --args.str = "test caption"
  --args.key = 1
  --args.code = 1
  --args.text = "77"
  --args.value = "88"
  --args.icode = 0
  --args.name = "qoka"
  --args.is_default = false
  --args.par_type = qlua_rpc.ColumnParameterType.QTABLE_STRING_TYPE
  --args.width = 15
  args.firmid = "MC0094600000"
  args.client_code = "55654"
  --args.sec_code = "AMZN"
  --args.trdaccid = "L01-00000F00"
  --args.limit_kind = 1
  --args.class_code = "SPBXM"
  --args.sec_code = "AMZN"
  --args.price = 930
  --args.param_name = "PREVPRICE"
  --args.table_name = "securities"
  --args.index = 1
  --args.client_code = "55654"

  --args.firmid = "SPBFUT"
  --args.tag = "1"
  --args.class_code = "SPBFUT"
  --args.sec_code = "RIU7"
  --args.trdaccid = "L01-00000F00"
  --args.trdaccid = "15002ed"
  args.tag = "EQTV"
  args.currcode = "SUR"
  --args.currcode = ""
  --args.limit_kind = 1
  --args.limit_type = 0
  --args.tag = "envel"
  --args.line = 0
  --args.first_candle = 100
  --args.count = 5
  
  --[[
  local t = {}
  t.account = "test"
  
  for k,v in pairs(t) do
      local trans = qlua_rpc.SendTransaction_Request.TransactionEntry()
      trans.key = tostring(k)
      trans.value = tostring(v)
      table.insert(args.transaction, trans)
  end
  --]]
  
  local ser_args = args:SerializeToString()
  request.args = ser_args

  local ser_request = request:SerializeToString()
  local msg_request = zmq.msg_init_data(ser_request)

  --print("Raw request data: "..ser_request.."\n")

  msg_request:send(self.socket)

  local msg_response = zmq.msg_init()
  msg_response:recv(self.socket)
  
  

  local response = qlua_rpc.Qlua_Response()
  response:ParseFromString( msg_response:data() )
  
  print("Message received. Response type is "..tostring(response.type))
  if response.is_error then print("Error: "..tostring(response.result)) return end
  
  if response.type == qlua_rpc.ProcedureType.IS_CONNECTED then
    local result = qlua_rpc.IsConnected_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [isConnected: %s]\n", result.is_connected) )
  elseif response.type == qlua_rpc.ProcedureType.GET_SCRIPT_PATH then
    local result = qlua_rpc.GetScriptPath_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [scriptPath: %s]\n", result.script_path) )
  elseif response.type == qlua_rpc.ProcedureType.GET_INFO_PARAM then
    local result = qlua_rpc.GetInfoParam_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [infoParam: %s]\n", result.info_param) )
  elseif response.type == qlua_rpc.ProcedureType.MESSAGE then
    local result = qlua_rpc.Message_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [result: %s]\n", result.result) )
  elseif response.type == qlua_rpc.ProcedureType.SLEEP then
    local result = qlua_rpc.Sleep_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [result: %s]\n", result.result) )
  elseif response.type == qlua_rpc.ProcedureType.GET_WORKING_FOLDER then
    local result = qlua_rpc.GetWorkingFolder_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [working_folder: %s]\n", result.working_folder) )
  elseif response.type == qlua_rpc.ProcedureType.GET_ITEM then
    local result = qlua_rpc.GetItem_Result()
    result:ParseFromString(response.result)
    for i, e in ipairs(result.table_row) do
        print( string.format("Received a reply [table_row: key=%s, value=%s]\n", e.key, e.value) )
    end
  elseif response.type == qlua_rpc.ProcedureType.GET_ORDER_BY_NUMBER then
    local result = qlua_rpc.GetOrderByNumber_Result()
    result:ParseFromString(response.result)
    print( string.format("Order indx: %d", result.indx) )
    for i, e in ipairs(result.order) do
        print( string.format("Received a reply [order: key=%s, value=%s]\n", e.key, e.value) )
    end
  elseif response.type == qlua_rpc.ProcedureType.GET_NUMBER_OF then
    local result = qlua_rpc.GetNumberOf_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [get_number_of: result=%d]\n", result.result) )
  elseif response.type == qlua_rpc.ProcedureType.SEARCH_ITEMS then
    local result = qlua_rpc.SearchItems_Result()
    result:ParseFromString(response.result)
    for i, item_index in ipairs(result.items_indices) do
      print( string.format("Received a reply [item index = %d]\n", item_index) )
    end
  elseif response.type == qlua_rpc.ProcedureType.GET_CLASSES_LIST then
    local result = qlua_rpc.GetClassesList_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [classes_list: %s]\n", result.classes_list) )
  elseif response.type == qlua_rpc.ProcedureType.GET_CLASS_INFO then
    local result = qlua_rpc.GetClassInfo_Result()
    result:ParseFromString(response.result)
    local klass = result.class_info
    print( string.format("[Class Info] firmid=%s, name=%s, code=%s, npars=%d, nsecs=%d]", klass.firmid, klass.name, klass.code, klass.npars, klass.nsecs) )
    --[[for k, v in pairs(result.class_info) do
        print( string.format("Received a reply [class_info_param: key=%s, value=%s]\n", k, v) )
    end
    --]]
  elseif response.type == qlua_rpc.ProcedureType.GET_CLASS_SECURITIES then
    local result = qlua_rpc.GetClassSecurities_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [class_securities: %s]\n", result.class_securities) )
  elseif response.type == qlua_rpc.ProcedureType.GET_MONEY then
    local result = qlua_rpc.GetMoney_Result()
    result:ParseFromString(response.result)
    local m = result.money
    print(
      string.format("[MONEY] money_open_limit=%s, money_limit_locked_nonmarginal_value=%s, money_limit_locked=%s, money_open_balance=%s, money_current_limit=%s, money_current_balance=%s, money_limit_available=%s \n", m.money_open_limit, m.money_limit_locked_nonmarginal_value, m.money_limit_locked, m.money_open_balance, m.money_current_limit, m.money_current_balance, m.money_limit_available)
    )
  elseif response.type == qlua_rpc.ProcedureType.GET_MONEY_EX then
    local result = qlua_rpc.GetMoneyEx_Result()
    result:ParseFromString(response.result)
    local m = result.money_ex
    print(
      string.format("[MONEY_EX] currcode=%s, tag=%s, firmid=%s, client_code=%s, openbal=%s, limit_kind=%d \n", m.currcode, m.tag, m.firmid, m.client_code, m.openbal, m.limit_kind)
    )
  elseif response.type == qlua_rpc.ProcedureType.GET_DEPO then
    local result = qlua_rpc.GetDepo_Result()
    result:ParseFromString(response.result)
    for i, e in ipairs(result.depo) do
        print( string.format("Received a reply [table_row: key=%s, value=%s]\n", e.key, e.value) )
    end
  elseif response.type == qlua_rpc.ProcedureType.GET_DEPO_EX then
    local result = qlua_rpc.GetDepoEx_Result()
    result:ParseFromString(response.result)
    for i, e in ipairs(result.depo_ex) do
        print( string.format("Received a reply [table_row: key=%s, value=%s]\n", e.key, e.value) )
    end
  elseif response.type == qlua_rpc.ProcedureType.GET_FUTURES_LIMIT then
    local result = qlua_rpc.GetFuturesLimit_Result()
    result:ParseFromString(response.result)
    for i, e in ipairs(result.futures_limit) do
        print( string.format("Received a reply [table_row: key=%s, value=%s]\n", e.key, e.value) )
    end
  elseif response.type == qlua_rpc.ProcedureType.GET_FUTURES_HOLDING then
    local result = qlua_rpc.GetFuturesHolding_Result()
    result:ParseFromString(response.result)
    for i, e in ipairs(result.futures_holding) do
        print( string.format("Received a reply [table_row: key=%s, value=%s]\n", e.key, e.value) )
    end
  elseif response.type == qlua_rpc.ProcedureType.GET_SECURITY_INFO then
    local result = qlua_rpc.GetSecurityInfo_Result()
    result:ParseFromString(response.result)
    for i, e in ipairs(result.security_info) do
        print( string.format("Received a reply [table_row: key=%s, value=%s]\n", e.key, e.value) )
    end
  elseif response.type == qlua_rpc.ProcedureType.GET_TRADE_DATE then
    local result = msg_requestqlua_rpc.GetTradeDate_Result()
    result:ParseFromString(response.result)
    for i, e in ipairs(result.trade_date) do
        print( string.format("Received a reply [table_row: key=%s, value=%s]\n", e.key, e.value) )
    end
  elseif response.type == qlua_rpc.ProcedureType.GET_QUOTE_LEVEL2 then
    local result = qlua_rpc.GetQuoteLevel2_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [bid_count: %s, offer_count: %s]\n", result.bid_count, result.offer_count) )
    for i, e in ipairs(result.bid) do
        print( string.format("Received a reply on bid [bid: price=%s, quantity=%s]\n", e.price, e.quantity) )
    end
    for i, e in ipairs(result.offer) do
        print( string.format("Received a reply on offer [offer: price=%s, quantity=%s]\n", e.price, e.quantity) )
    end
  elseif response.type == qlua_rpc.ProcedureType.GET_LINES_COUNT then
    local result = qlua_rpc.GetLinesCount_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [lines_count: %s]\n", result.lines_count) )
  elseif response.type == qlua_rpc.ProcedureType.GET_NUM_CANDLES then
    local result = qlua_rpc.GetNumCandles_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [num_candles: %s]\n", result.num_candles) )
  elseif response.type == qlua_rpc.ProcedureType.GET_CANDLES_BY_INDEX then
    local result = qlua_rpc.GetCandlesByIndex_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [n: %s, l: %s]\n", result.n, result.l) )
    for i, e in ipairs(result.t) do
        print( string.format("Received a reply on candle #%d [open=%s, close=%s, high=%s, low=%s, volume=%s, does_exist=%d]\n", i, e.open, e.close, e.high, e.low, e.volume, e.does_exist) )
        print( string.format("datetime: [mcs=%s, ms=%s, sec=%d, min=%d, hour=%d, day=%d, week_day=%d, month=%d, year=%d]\n", e.datetime.mcs, e.datetime.ms, e.datetime.sec, e.datetime.min, e.datetime.hour, e.datetime.day, e.datetime.week_day, e.datetime.month, e.datetime.year) )
        print("-----")
    end
  elseif response.type == qlua_rpc.ProcedureType.CREATE_DATA_SOURCE then
    local result = qlua_rpc.CreateDataSource_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [create_datasource: datasource_uuid=%s, is_error=%s, error_desc=%s]\n", result.datasource_uuid, result.is_error, result.error_desc) )
  elseif response.type == qlua_rpc.ProcedureType.DS_SET_UPDATE_CALLBACK then
    local result = qlua_rpc.DataSourceSetUpdateCallback_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [datasource_set_update_callback: result=%s]\n", result.result) )
  elseif response.type == qlua_rpc.ProcedureType.DS_O then
    local result = qlua_rpc.DataSourceO_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [datasource_o: value=%d]\n", result.value) )
  elseif response.type == qlua_rpc.ProcedureType.DS_H then
    local result = qlua_rpc.DataSourceH_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [datasource_h: value=%d]\n", result.value) )
  elseif response.type == qlua_rpc.ProcedureType.DS_L then
    local result = qlua_rpc.DataSourceL_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [datasource_l: value=%d]\n", result.value) )
  elseif response.type == qlua_rpc.ProcedureType.DS_C then
    local result = qlua_rpc.DataSourceC_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [datasource_c: value=%d]\n", result.value) )
  elseif response.type == qlua_rpc.ProcedureType.DS_V then
    local result = qlua_rpc.DataSourceV_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [datasource_v: value=%d]\n", result.value) )
  elseif response.type == qlua_rpc.ProcedureType.DS_SIZE then
    local result = qlua_rpc.DataSourceSize_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [datasource_size: value=%d]\n", result.value) )
  elseif response.type == qlua_rpc.ProcedureType.DS_T then
    local result = qlua_rpc.DataSourceT_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [datasource_t: year=%d, month=%d, day=%d, week_day=%d, hour=%d, min=%d, sec=%d, ms=%d, count=%d]\n", result.year, result.month, result.day, result.week_day, result.hour, result.min, result.sec, result.ms, result.count) )
  elseif response.type == qlua_rpc.ProcedureType.DS_SET_EMPTY_CALLBACK then
    local result = qlua_rpc.DataSourceSetEmptyCallback_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [datasource_set_empty_callback: result=%s]\n", result.result) )
  elseif response.type == qlua_rpc.ProcedureType.DS_CLOSE then
    local result = qlua_rpc.DataSourceClose_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [datasource_close: result=%s]\n", result.result) )
  elseif response.type == qlua_rpc.ProcedureType.SEND_TRANSACTION then
    local result = qlua_rpc.SendTransaction_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [transaction_result: '%s']\n", result.result) )
  elseif response.type == qlua_rpc.ProcedureType.CALC_BUY_SELL then
    local result = qlua_rpc.CalcBuySell_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [calc_buy_sell result: qty=%d, comission=%d]\n", result.qty, result.comission) )
  elseif response.type == qlua_rpc.ProcedureType.GET_PARAM_EX then
    local result = qlua_rpc.GetParamEx_Result()
    result:ParseFromString(response.result)
    for i, e in ipairs(result.param_ex) do
        print( string.format("Received a reply [param_ex: key=%s, value=%s]\n", e.key, e.value) )
    end
  elseif response.type == qlua_rpc.ProcedureType.GET_PARAM_EX_2 then
    local result = qlua_rpc.GetParamEx_Result()
    result:ParseFromString(response.result)
    for i, e in ipairs(result.param_ex) do
        print( string.format("Received a reply [param_ex_2: key=%s, value=%s]\n", e.key, e.value) )
    end
  elseif response.type == qlua_rpc.ProcedureType.GET_PORTFOLIO_INFO then
    local result = qlua_rpc.GetPortfolioInfo_Result()
    result:ParseFromString(response.result)
    for i, e in ipairs(result.portfolio_info) do
        print( string.format("Received a reply [portfolio_info: key=%s, value=%s]\n", e.key, e.value) )
    end
  elseif response.type == qlua_rpc.ProcedureType.GET_PORTFOLIO_INFO_EX then
    local result = qlua_rpc.GetPortfolioInfoEx_Result()
    result:ParseFromString(response.result)
    for i, e in ipairs(result.portfolio_info_ex) do
        print( string.format("Received a reply [portfolio_info_ex: key=%s, value=%s]\n", e.key, e.value) )
    end
  elseif response.type == qlua_rpc.ProcedureType.GET_BUY_SELL_INFO or response.type == qlua_rpc.ProcedureType.GET_BUY_SELL_INFO_EX then
    local result = qlua_rpc.GetBuySellInfo_Result()
    result:ParseFromString(response.result)
    for i, e in ipairs(result.buy_sell_info) do
        print( string.format("Received a reply [buy_sell_info: key=%s, value=%s]\n", e.key, e.value) )
    end
  elseif response.type == qlua_rpc.ProcedureType.ADD_COLUMN then
    local result = qlua_rpc.AddColumn_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [add_column: result=%d]\n", result.result) )
  elseif response.type == qlua_rpc.ProcedureType.ALLOC_TABLE then
    local result = qlua_rpc.AllocTable_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [alloc_table: t_id=%d]\n", result.t_id) )
  elseif response.type == qlua_rpc.ProcedureType.CLEAR then
    local result = qlua_rpc.Clear_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [clear: result=%s]\n", result.result) )
  elseif response.type == qlua_rpc.ProcedureType.CREATE_WINDOW then
    local result = qlua_rpc.CreateWindow_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [create_window: result=%d]\n", result.result) )
  elseif response.type == qlua_rpc.ProcedureType.DELETE_ROW then
    local result = qlua_rpc.DeleteRow_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [delete_row: result=%s]\n", result.result) )
  elseif response.type == qlua_rpc.ProcedureType.DESTROY_TABLE then
    local result = qlua_rpc.DestroyTable_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [destroy_table: result=%s]\n", result.result) )
  elseif response.type == qlua_rpc.ProcedureType.INSERT_ROW then
    local result = qlua_rpc.InsertRow_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [insert_row: result=%d]\n", result.result) )
  elseif response.type == qlua_rpc.ProcedureType.IS_WINDOW_CLOSED then
    local result = qlua_rpc.IsWindowClosed_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [is_window_closed: result=%s]\n", result.result) )
  elseif response.type == qlua_rpc.ProcedureType.GET_CELL then
    local result = qlua_rpc.GetCell_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [get_cell: image=%s, value=%s]\n", result.image, result.value == "" and "nil" or result.value) )
  elseif response.type == qlua_rpc.ProcedureType.SET_CELL then
    local result = qlua_rpc.SetCell_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [set_cell: result=%s]\n", result.result) )
  elseif response.type == qlua_rpc.ProcedureType.SET_WINDOW_CAPTION then
    local result = qlua_rpc.SetWindowCaption_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [set_window_caption: result=%s]\n", result.result) )
  elseif response.type == qlua_rpc.ProcedureType.SET_WINDOW_POS then
    local result = qlua_rpc.SetWindowPos_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [set_window_pos: result=%s]\n", result.result) )
  elseif response.type == qlua_rpc.ProcedureType.SET_TABLE_NOTIFICATION_CALLBACK then
    local result = qlua_rpc.SetTableNotificationCallback_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [set_table_notification_callback: result=%s]\n", result.result) )
  elseif response.type == qlua_rpc.ProcedureType.GET_TABLE_SIZE then
    local result = qlua_rpc.GetTableSize_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [get_table_size: rows=%d, col=%d]\n", result.rows, result.col) )
  elseif response.type == qlua_rpc.ProcedureType.GET_WINDOW_CAPTION then
    local result = qlua_rpc.GetWindowCaption_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [get_window_caption: caption=%s]\n", result.caption) )
  elseif response.type == qlua_rpc.ProcedureType.SET_COLOR then
    local result = qlua_rpc.SetColor_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [set_color: result=%s]\n", result.result) )
  elseif response.type == qlua_rpc.ProcedureType.GET_WINDOW_RECT then
    local result = qlua_rpc.GetWindowRect_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [get_window_rect: top=%d, left=%d, bottom=%d, right=%d]\n", result.top, result.left, result.bottom, result.right) )
  elseif response.type == qlua_rpc.ProcedureType.RGB then
    local result = qlua_rpc.RGB_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [rgb: result=%s]\n", result.result) )
  elseif response.type == qlua_rpc.ProcedureType.HIGHLIGHT then
    local result = qlua_rpc.Highlight_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [highlight: result=%s]\n", result.result) )
  elseif response.type == qlua_rpc.ProcedureType.SET_SELECTED_ROW then
    local result = qlua_rpc.SetSelectedRow_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [set_selected_row: result=%s]\n", result.result) )
  elseif response.type == qlua_rpc.ProcedureType.ADD_LABEL then
    local result = qlua_rpc.AddLabel_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [add_label: label_id=%d]\n", result.label_id) )
  elseif response.type == qlua_rpc.ProcedureType.DEL_LABEL then
    local result = qlua_rpc.DelLabel_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [del_label: result=%s]\n", result.result) )
  elseif response.type == qlua_rpc.ProcedureType.DEL_ALL_LABELS then
    local result = qlua_rpc.DelAllLabels_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [del_all_labels: result=%s]\n", result.result) )
  elseif response.type == qlua_rpc.ProcedureType.GET_LABEL_PARAMS then
    local result = qlua_rpc.GetLabelParams_Result()
    result:ParseFromString(response.result)
    for i, e in ipairs(result.label_params) do
        print( string.format("Received a reply [get_label_params: key=%s, value=%s]\n", e.key, e.value) )
    end
  elseif response.type == qlua_rpc.ProcedureType.SET_LABEL_PARAMS then
    local result = qlua_rpc.SetLabelParams_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [set_label_params: result=%s]\n", result.result) )
  elseif response.type == qlua_rpc.ProcedureType.SUBSCRIBE_LEVEL_II_QUOTES then
    local result = qlua_rpc.SubscribeLevel2Quotes_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [subscribe_level2_quotes: result=%s]\n", result.result) )
  elseif response.type == qlua_rpc.ProcedureType.UNSUBSCRIBE_LEVEL_II_QUOTES then
    local result = qlua_rpc.UnsubscribeLevel2Quotes_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [unsubscribe_level2_quotes: result=%s]\n", result.result) )
  elseif response.type == qlua_rpc.ProcedureType.IS_SUBSCRIBED_LEVEL_II_QUOTES then
    local result = qlua_rpc.IsSubscribedLevel2Quotes_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [is_subscribed_level2_quotes: result=%s]\n", result.result) )
  elseif response.type == qlua_rpc.ProcedureType.PARAM_REQUEST then
    local result = qlua_rpc.ParamRequest_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [param_request: result=%s]\n", result.result) )
  elseif response.type == qlua_rpc.ProcedureType.CANCEL_PARAM_REQUEST then
    local result = qlua_rpc.CancelParamRequest_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [cancel_param_request: result=%s]\n", result.result) )
  elseif response.type == qlua_rpc.ProcedureType.BIT_TOHEX then
    local result = qlua_rpc.BitToHex_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [bit_to_hex: result=%s]\n", result.result) )
  elseif response.type == qlua_rpc.ProcedureType.BIT_BNOT then
    local result = qlua_rpc.BitBNot_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [bit_bnot: result=%s]\n", result.result) )
  elseif response.type == qlua_rpc.ProcedureType.BIT_BAND then
    local result = qlua_rpc.BitBAnd_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [bit_band: result=%s]\n", result.result) )
  elseif response.type == qlua_rpc.ProcedureType.BIT_BOR then
    local result = qlua_rpc.BitBOr_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [bit_bor: result=%s]\n", result.result) )
  elseif response.type == qlua_rpc.ProcedureType.BIT_BXOR then
    local result = qlua_rpc.BitBXor_Result()
    result:ParseFromString(response.result)
    print( string.format("Received a reply [bit_bxor: result=%s]\n", result.result) )
  end

  print ("closing...\n")
  self.socket:close()
  ctx:term()
end

local instance = Client;
instance:init("tcp://127.0.0.1:5560")
instance:start()
