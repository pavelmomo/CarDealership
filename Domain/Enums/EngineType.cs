using System.ComponentModel;

namespace Domain.Enums
{
    public enum EngineType
    {
        [Description("бензиновый")]
        gasoline = 0,
        [Description("на газу")]
        gas = 1,
        [Description("электрический")]
        electric = 2,
        [Description("гибридный")]
        hybrid = 3
    }

}