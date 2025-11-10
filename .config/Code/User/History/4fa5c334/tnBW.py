# -*- coding: utf-8 -*-
from odoo import models, fields


class CrmLead(models.Model):
    _inherit = 'crm.lead'

    category_id = fields.Many2many(
        'res.partner.category',
        string='Customer Type',
        related='partner_id.category_id',
        readonly=False,
        store=True,
        help="Tags from the related customer/partner"
    )
