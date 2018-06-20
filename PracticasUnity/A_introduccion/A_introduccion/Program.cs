using System;

namespace A_introduccion
{
	class MainClass
	{
		public static void Main (string[] args)
		{
			Console.WriteLine ("Hola como te llamas?");

			string nombre = Console.ReadLine();
			Console.WriteLine ("Hola " +  nombre);
		}
	}
}
