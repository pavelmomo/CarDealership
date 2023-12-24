using System.ComponentModel;

namespace Domain.Enums
{
    public enum TransmissionType
    {
        [Description("механическая")]
        mechanic = 0,
        [Description("автоматическая")]
        automatic = 1,
        [Description("роботизированная")]
        robot = 2,
        [Description("вариативная")]
        variator = 3,
    }
}