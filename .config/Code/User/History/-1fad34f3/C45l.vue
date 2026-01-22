<script setup>
import KitsetStockLevel from '../Invoice/KitsetStockLevel.vue';
const loading = useState('loading');
let quote = useState('quote');
const country = useState('country');
const product = useRoute().params.product;
const componentModal = useState('componentModal');
componentModal.value = { selected: false };

async function removeComponent(component) {
    loading.value = true;
    const response = await $fetch('/api/quote/component/remove', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: component,
    });
    quote.value = response;
    loading.value = false;
}
async function updateQuantity(component) {
    loading.value = true;
    console.log(component);
    const response = await $fetch('/api/quote/component/update', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            component: component,
            quantity: component.quantity,
        }),
    });
    quote.value = response;
    loading.value = false;
}
</script>

<template>
    <KitsetStockLevel />
    <table class="divide-y divide-gray-200 border rounded">
        <thead class="bg-gray-50">
            <tr>
                <th class="table-heading">Product Name</th>
                <th class="table-heading">Quantity</th>
                <th class="table-heading">Unit Price</th>
                <th class="table-heading">Subtotal</th>
                <th class="table-heading">
                    Weight (<slot name="weight-unit" />)
                </th>
                <th class="table-heading">Stock Available</th>
                <th class="table-heading"></th>
            </tr>
        </thead>
        <tbody class="bg-white divide-y divide-gray-200">
            <tr
                v-for="component in quote.quote_components"
                @change="updateQuantity(component)"
            >
                <td class="py-2 pl-1 whitespace-nowrap">
                    <NuxtLink
                        :to="`/${country}/${product}/${component.code}/`"
                        class="underline"
                    >
                        <slot name="name" v-bind="component"></slot>
                    </NuxtLink>
                </td>
                <td class="py-2 text-center whitespace-nowrap">
                    <input
                        type="number"
                        v-model="component.quantity"
                        class="w-16 text-center"
                    />
                </td>
                <td class="py-2 text-center whitespace-nowrap">
                    <!-- This is the db price so that if prices change the quoted price is still saved -->
                    <slot name="currency-symbol"></slot
                    >{{ component.price?.toFixed(2) }}
                </td>
                <td class="py-2 text-center whitespace-nowrap">
                    <slot name="currency-symbol"></slot
                    >{{
                        (
                            component.quantity * component.price.toFixed(2)
                        ).toFixed(2)
                    }}
                </td>
                <td class="py-2 text-center whitespace-nowrap">
                    <slot name="weight" v-bind="component"></slot>
                </td>
                <td
                    v-if="component.products.type === 'kitset'"
                    class="py-2 text-center whitespace-nowrap"
                >
                    <button
                        @click="
                            () => {
                                componentModal.selected =
                                    !componentModal.selected;
                                componentModal.component = component;
                            }
                        "
                        class="button"
                    >
                        View
                    </button>
                </td>
                <td v-else class="py-2 text-center whitespace-nowrap">
                    {{
                        component.products.product_stock_levels.length
                            ? component.products.product_stock_levels[0]
                                  .stock_available
                            : 0
                    }}
                </td>
                <td class="py-2 pr-2 text-center whitespace-nowrap">
                    <button @click="removeComponent(component)" class="button">
                        Remove
                    </button>
                </td>
            </tr>
            <tr>
                <th></th>
                <th></th>
                <th></th>
                <th
                    class="py-3 text-center text-s font-medium whitespace-nowrap"
                >
                    <slot name="currency-symbol"></slot
                    >{{ quote.price?.toFixed(2) }}
                </th>
                <th
                    class="py-3 text-center text-s font-medium whitespace-nowrap"
                >
                    <slot name="total-weight"></slot>
                </th>
                <th></th>
                <th></th>
            </tr>
        </tbody>
    </table>
</template>
