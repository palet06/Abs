//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Abs.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Dash
    {
        public int DashId { get; set; }
        public int DriverId { get; set; }
        public int ManagerId { get; set; }
        public int CarId { get; set; }
        public System.DateTime Date { get; set; }
    
        public virtual Car Car { get; set; }
        public virtual Driver Driver { get; set; }
        public virtual Manager Manager { get; set; }
    }
}