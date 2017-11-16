﻿using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Shop.Models;
using Microsoft.EntityFrameworkCore;
using Easy;

namespace ZKEACMS.Shop.Service
{
    public class OrderService : ServiceBase<Order>, IOrderService
    {
        public OrderService(IApplicationContext applicationContext, OrderDbContext dbContext) : base(applicationContext, dbContext)
        {
        }

        public override DbSet<Order> CurrentDbSet => (DbContext as OrderDbContext).Order;
        public override void Add(Order item)
        {
            item.ID = Guid.NewGuid().ToString("N");
            base.Add(item);
        }
    }
}