

class Rueda
{
	var property nivelDesgaste
	
	method desgastar(valor)
	{
		nivelDesgaste += valor

		if (not self.sirve()) 
			self.error("cambiame ya!!")
	}
	
	method sirve() = nivelDesgaste < 100
	
	
}