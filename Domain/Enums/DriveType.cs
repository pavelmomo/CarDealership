
using System.ComponentModel;

namespace Domain.Enums
{
    public enum DriveType
    {
        [Description("передний")]
        front = 0,
        [Description("задний")]
        rear = 1,
        [Description("полный")]
        full = 2
    }

}
