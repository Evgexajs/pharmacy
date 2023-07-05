from django import template

register = template.Library()

@register.filter
def has_order_item(order, medicament):
    return order.order_items.filter(medicament=medicament).exists()
