//+------------------------------------------------------------------+
//|                                                      Periodo.mqh |
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
#include "CandleList.mqh" 
#include "Candle.mqh"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CPeriodo : public CObject
  {
private:
   CCandleList       candles;
   int               total;

public:
                     CPeriodo();
                    ~CPeriodo();

   int               getTotal(void);
   void              AddCandle(CCandle *pCandle);
   CCandle          *getCandleAnterior(void);

   bool              isUPAsc(int periods);
   bool              isDownDesc(int periods);
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CPeriodo::CPeriodo()
  {

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CPeriodo::~CPeriodo()
  {
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
CPeriodo::AddCandle(CCandle *pCandle)
  {
   candles.Add(pCandle);
   this.total=candles.Total();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CCandle *CPeriodo::getCandleAnterior(void)
  {
   return candles.GetNodeAtIndex(getTotal() - 1);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int CPeriodo::getTotal(void)
  {
   return candles.Total();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CPeriodo::isUPAsc(int periods)
  {
   bool ret=false;

   if(total <= 0) return(false);

   CCandle *candleAux;
   double lowAux=candles.GetNodeAtIndex(total-periods).getLow();

   for(int i=(total-periods); i<total && i>=0 && (total-i>=0); i++)
     {
      candleAux=candles.GetNodeAtIndex(i);

      if((candleAux.getOpen()<candleAux.getClose()) && (candleAux.getLow()>=lowAux))
        {
         lowAux=candleAux.getLow();
         ret=true;
        }
      else
        {
         i=total-1;
         ret=false;
        }
     }
   return(ret);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CPeriodo::isDownDesc(int periods)
  {
   if(total <= 0) return(false);

   bool ret=false;

   CCandle *candleAux;
   double highAux=candles.GetNodeAtIndex(total-periods).getHigh();

   for(int i=(total-periods); i<total && i>=0 && (total-i>=0); i++)
     {
      candleAux=candles.GetNodeAtIndex(i);

      if((candleAux.getOpen()>candleAux.getClose()) && (candleAux.getHigh()<=highAux))
        {
         ret=true;
         highAux=candleAux.getHigh();
        }
      else
        {
         i=total-1;
         ret=false;
        }
     }

   return(ret);
  }
//+------------------------------------------------------------------+
