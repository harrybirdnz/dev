# Copyright 2023 ooops404
# License AGPL-3 - See https://www.gnu.org/licenses/agpl-3.0.html
from odoo import api, fields, models


class PurchaseOrderLine(models.Model):
    _inherit = "purchase.order.line"

    line_weight = fields.Float(
        "Weight", compute="_compute_line_physical_properties", digits="Stock Weight"
    )
    line_volume = fields.Float(
        "Volume", compute="_compute_line_physical_properties", digits="Volume"
    )

    @api.depends("product_uom_qty", "product_id")
    def _compute_line_physical_properties(self):
        for line in self:
            line.line_weight = line.product_id.weight * line.product_uom_qty
            line.line_volume = line.product_id.volume * line.product_uom_qty