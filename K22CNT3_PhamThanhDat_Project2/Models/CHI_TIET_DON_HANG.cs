//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace K22CNT3_PhamThanhDat_Project2.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class CHI_TIET_DON_HANG
    {
        public int MaChiTiet { get; set; }
        public int MaGioHang { get; set; }
        public int MaSP { get; set; }
        public int So_luong { get; set; }
        public decimal Gia { get; set; }
    
        public virtual GIO_HANG GIO_HANG { get; set; }
        public virtual SANPHAM SANPHAM { get; set; }
    }
}