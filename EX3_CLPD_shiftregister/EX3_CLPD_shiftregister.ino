class Shift_register
{
private:
  int _clock,_data,_load;
  int _length;
public:
  Shift_register(int clock_pin,int data_pin,int load_pin,int register_length);
  void write(unsigned long data);
};


Shift_register::Shift_register(int clock_pin,int data_pin,int load_pin,int register_length)
{
  _clock=clock_pin;
  _data =data_pin;
  _load =load_pin;
  _length=register_length;
  pinMode(_clock, OUTPUT);
  pinMode(_data , OUTPUT);
  pinMode(_load , OUTPUT);
}

void Shift_register::write(unsigned long data)
{
  digitalWrite(_clock,LOW);
  digitalWrite(_load,LOW);

  for(unsigned long i=1L<<(_length-1) ; i!=0 ; i>>=1)
  {
  digitalWrite(_data,(data&i)!=0);
  digitalWrite(_clock,HIGH);
  digitalWrite(_clock,LOW);
  }
  // transfer the data
  digitalWrite(_load,HIGH);
  digitalWrite(_load,LOW);
  
}
#define PIN_DATA 2
#define PIN_CLOCK 3
#define PIN_LOAD 4

Shift_register shiftReg(PIN_CLOCK,PIN_DATA,PIN_LOAD,28);
long unsigned ledPattern=1;
bool shiftLeft=true;

void setup() {

}


void loop() {
shiftReg.write(ledPattern);

if(ledPattern==0x1)
  {
  shiftLeft=true;
  }
else if(ledPattern==0x8000)
  {
  shiftLeft=false;
  }
 
if (shiftLeft)
  {
  ledPattern<<=1;
  }
else
  {
  ledPattern>>=1;
  }
delay(40);
}
