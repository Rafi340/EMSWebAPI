using System.ComponentModel.DataAnnotations;


namespace EMS.Model
{
    public class EMSBaseModel
    {
       public DateTime CreatedAt {  get; set; }
       public DateTime? LastUpdatedAt { get; set; }
    }
}
