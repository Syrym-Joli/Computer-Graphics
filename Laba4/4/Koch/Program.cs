using System;
using Microsoft.SmallBasic.Library;

namespace Koch
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Title = "СМС";
            Console.WriteLine("\tПривет!! Меня зовут черепаха Turtle");
            GraphicsWindow.DrawText(305, 230, "Дом");
            GraphicsWindow.DrawLine(295, 210, 320, 180);
            GraphicsWindow.DrawLine(346, 210, 320, 180);
            GraphicsWindow.DrawRectangle(295, 210, 50, 50);
            Turtle.Speed = 3;
            Console.WriteLine("Мая скорость сейчас = {0}", Turtle.Speed);
            Console.WriteLine("-Вышел из дома");
            Turtle.PenUp();
            Turtle.Move(200);
            Turtle.Turn(-90);
            Turtle.PenDown();
            if (Turtle.Speed <= 3)
                Turtle.Speed = 6;
            
            GraphicsWindow.BackgroundColor = "blue";
            Console.WriteLine("-Ура! Я попал в море");
            Console.WriteLine("  сейчас скорость = {0}", Turtle.Speed);
            Turtle.Move(300);
            Turtle.Turn(-90);
            Turtle.Move(500);
            Turtle.Turn(-90);

            Turtle.Speed = 9;
            Console.WriteLine("-Упс!! Меня у носит течения.. :( ");
            Console.WriteLine("  сейчас скорость = {0}", Turtle.Speed);
            Turtle.Move(700);
            Turtle.Speed = 6;
            Console.WriteLine("-Ух! Я вышел из течения");
            Console.WriteLine("  сейчас скорость = {0}", Turtle.Speed);
            Turtle.Turn(-90);
            Turtle.Move(500);
            Turtle.Turn(-90);
            Turtle.Move(395);
            Turtle.Turn(-90);
            Turtle.Speed = 3;
            GraphicsWindow.BackgroundColor = "white";
            Turtle.Move(200);

            Turtle.Turn(180);
            Console.WriteLine("-Я дома :)"); 
        }
    }
}
