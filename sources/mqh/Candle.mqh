//+------------------------------------------------------------------+
//|                                                       Candle.mqh |
//|        Jonathan Andrei Schmitt, Rodriza Assessoria e Treinamento |
//|                    https://www.mql5.com/pt/users/jonathanschmitt |
//+------------------------------------------------------------------+
#property copyright "Jonathan Andrei Schmitt, Rodriza Assessoria e Treinamento"
#property link      "https://www.mql5.com/pt/users/jonathanschmitt"
#property version   "1.00"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

#include <Object.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CCandle : public CObject
  {
private:
   double            high;
   double            low;
   double            open;
   double            close;
   double            pontos;
   bool              alta;

   bool              entrou;
   bool              saiu;

   void              updateAlta(void);
   void              updatePontos(void);

public:
                     CCandle();
                    ~CCandle();

   void              setHigh(double pHigh);
   void              setLow(double pLow);
   void              setOpen(double pOpen);
   void              setClose(double pClose);

   void              setEntradaOperacao(bool isEntrada);
   void              setSaidaOperacao(bool isSaida);

   double            getHigh(void);
   double            getLow(void);
   double            getOpen(void);
   double            getClose(void);
   double            getPontos(void);

   bool              isCandleAlta(void);
   bool              isCandleEntrada(void);
   bool              isCandleSaida(void);
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CCandle::CCandle()
  {
   entrou=false;
   saiu=false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CCandle::~CCandle()
  {
  }
//+------------------------------------------------------------------+
//|
//+Getters e Setters-------------------------------------------------+
void CCandle::setHigh(double pHigh)
  { this.high=pHigh; }

void CCandle::setLow(double pLow)
  { this.low=pLow; }

void CCandle::setOpen(double pOpen)
  { this.open=pOpen; updateAlta(); updatePontos(); }

void CCandle::setClose(double pClose)
  { this.close=pClose; updateAlta(); updatePontos(); }

void CCandle::setEntradaOperacao(bool isEntrada)
  { this.entrou=true; }

void CCandle::setSaidaOperacao(bool isSaida)
  { this.saiu=true; }

double CCandle::getHigh(void)
  { return this.high; }

double CCandle::getLow(void)
  { return this.low; }

double CCandle::getOpen(void)
  { return this.open; }

double CCandle::getClose(void)
  { return this.close; }

double CCandle::getPontos(void)
  { return this.pontos; }

bool CCandle::isCandleAlta(void)
  { return this.alta; }

bool CCandle::isCandleEntrada(void)
  { return this.entrou; }

bool CCandle::isCandleSaida(void)
  { return this.saiu; }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CCandle::updateAlta(void)
  {
   if(this.close == 0 || this.open == 0) return;
   this.alta=this.close>this.open;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CCandle::updatePontos(void)
  {
   if(this.close == 0 || this.open == 0) return;
   if(this.alta) this.pontos=this.close-this.open;
   else this.pontos=this.open-this.close;
  }
//+------------------------------------------------------------------+
