using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Drawing;
using System.ComponentModel;

namespace DreamWork.Report
{
    public interface IDreamWorkChart : IComponent
    {
        Bitmap Image { get; }
        void Draw();
        int Width { get; set; }
        int Height { get; set; }
    }
}
        