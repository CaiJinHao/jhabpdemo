using System;
using System.Collections.Generic;
using System.Text;
using Volo.Abp.Domain.Entities.Auditing;
using Volo.Abp.MultiTenancy;

namespace MyDemo
{
    public class Category : FullAuditedEntity<Guid>, IMultiTenant
    {
        public string Name { get; set; }
        public string Description { get; set; }

        public virtual Guid? TenantId { get; set; }
    }
}
