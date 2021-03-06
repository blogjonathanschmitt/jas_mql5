//+------------------------------------------------------------------+
//|                                                     Operacao.mqh |
//|        Jonathan Andrei Schmitt, Rodriza Assessoria e Treinamento |
//|                    https://www.mql5.com/pt/users/jonathanschmitt |
//+------------------------------------------------------------------+
#property copyright "Jonathan Andrei Schmitt, Rodriza Assessoria e Treinamento"
#property link      "https://www.mql5.com/pt/users/jonathanschmitt"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Include                                                          |
//+------------------------------------------------------------------+
#include <Expert\Expert.mqh>
#include <Object.mqh>
//+------------------------------------------------------------------+
//| Inputs                                                           |
//+------------------------------------------------------------------+
class COperacao : public CObject
  {
private:
   double            price;
   double            stop;
   double            gain;
   ENUM_ORDER_TYPE   type;

public:
                     COperacao();
                    ~COperacao();
   bool              operar(ENUM_TRADE_REQUEST_ACTIONS action, ENUM_ORDER_TYPE type,double price,double volume,double stop,double gain);

  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
COperacao::COperacao()
  {
   entrou=false;
   saiu=false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool COperacao::~operar(ENUM_TRADE_REQUEST_ACTIONS action, ENUM_ORDER_TYPE type,double price,double volume,double stop,double gain)
  {
//-- declaração e inicialização do pedido e o seu resultado
   MqlTradeRequest request = {0};
   MqlTradeResult  result = {0};
//--- parâmetros para colocação da ordem pendente
   request.action = action;                             // tipo de operação de negociação
   request.type = type;
   request.symbol = Symbol();                                         // símbolo
   request.volume = volume;                                              // volume de 0.1 lotes
   request.deviation = 2;                                                //desvio permitido do preço
   request.magic = EXPERT_MAGIC;                                                         // preço de execução da ordem
   int digits = SymbolInfoInteger(_Symbol,SYMBOL_DIGITS);                // número de símbolos depois da coma (precisão)
   request.price = NormalizeDouble(price,digits);
//--- enviar a ordem
   if(!OrderSend(request,result))
     {
      PrintFormat("OrderSend error %d",GetLastError()); 
      return false;
     }                 // Se não for possível enviar o pedido, exibir um código de erro
//--- informações sobre a operação
   PrintFormat("retcode=%u  deal=%I64u  order=%I64u",result.retcode,result.deal,result.order);
   return true;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
COperacao::COperacao()
  {
   entrou=false;
   saiu=false;
  }
//+------------------------------------------------------------------+
//|
//+Getters e Setters-------------------------------------------------+
