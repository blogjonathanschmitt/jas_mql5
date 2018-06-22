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

public:
                     COperacao();
                    ~COperacao();


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
COperacao::~COperacao()
  {
  }
//+------------------------------------------------------------------+
//|
//+Getters e Setters-------------------------------------------------+
