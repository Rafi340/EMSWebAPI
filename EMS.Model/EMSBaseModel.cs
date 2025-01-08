using System.ComponentModel.DataAnnotations;


namespace EMS.Model
{
    public class EMSBaseModel
    {
       public DateTime? CreatedAt {  get; set; } = DateTime.UtcNow;
       public DateTime? LastUpdatedAt { get; set; } = DateTime.UtcNow;
    }
}
