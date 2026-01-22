<script setup>
const invoice = useState('invoice');
const loading = useState('loading');
const country = useState('country');
const componentModal = useState('componentModal');
componentModal.value = { selected: false };
const { data } = await useFetch('/api/invoice/test');
console.log(data.value);

async function removeComponent(component) {
    loading.value = true;
    console.log(component);
    const response = await $fetch('/api/invoice/component/remove', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            component: component,
            country: country.value.toLowerCase(),
        }),
    });
    invoice.value = response;
    loading.value = false;
}
async function updateQuantity(component) {
    loading.value = true;
    const response = await $fetch('/api/invoice/component/update', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            component: component,
            country: country.value.toLowerCase(),
        }),
    });
    invoice.value = response;
    loading.value = false;
}
const weight_sum = computed(() => {
    let total = 0;
    invoice.value.invoice_components.forEach((component) => {
        total += component.products.weight * component.quantity;
    });
    return total;
});
</script>

<template>
    <div class="mx-auto w-full">
        <div class="border border-gray-200 sm:rounded-lg">
            <table class="divide-y divide-gray-200">
                <thead class="bg-gray-50">
                    <tr>
                        <th class="table-heading">Product Name</th>
                        <th class="table-heading">Quantity</th>
                        <th class="table-heading">Unit Price</th>
                        <th class="table-heading">Subtotal</th>
                        <th class="table-heading">Stock Level</th>
                        <th class="table-heading">Stock Held</th>
                        <th class="table-heading">Stock Available</th>
                        <th class="table-heading">
                            Weight (<slot name="weight-unit"></slot>)
                        </th>
                        <th class="table-heading"></th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200 text-center">
                    <tr
                        v-for="component in invoice.invoice_components.sort(
                            (a, b) => a.code.localeCompare(b.code)
                        )"
                    >
                        <td class="px-2 py-2 whitespace-nowrap">
                            <slot name="name" v-bind="component"></slot>
                        </td>
                        <td class="px-2 py-2 whitespace-nowrap">
                            <input
                                type="number"
                                v-model="component.quantity"
                                @change="updateQuantity(component)"
                                class="w-16 border border-black rounded-md p-2"
                            />
                        </td>
                        <td
                            class="px-2 py-2 whitespace-nowrap"
                            @change="updateQuantity(component)"
                        >
                            <input
                                type="number"
                                step="0.01"
                                v-model="component.price"
                                class="text-center"
                            />
                        </td>
                        <td class="px-2 py-2 whitespace-nowrap">
                            {{
                                (
                                    component.quantity *
                                    component.price.toFixed(2)
                                ).toFixed(2)
                            }}
                        </td>
                        <td
                            v-if="component.products.type != 'kitset'"
                            class="px-2 py-2 whitespace-nowrap"
                        >
                            {{
                                component.products.product_stock_levels.length
                                    ? component.products.product_stock_levels[0]
                                          .stock_level
                                    : 0
                            }}
                        </td>
                        <td v-else class="px-2 py-2 whitespace-nowrap">
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
                        <td
                            v-if="component.products.type != 'kitset'"
                            class="px-2 py-2 whitespace-nowrap"
                        >
                            {{
                                component.products.product_stock_levels.length
                                    ? component.products.product_stock_levels[0]
                                          .stock_held
                                    : 0
                            }}
                        </td>
                        <td v-else class="px-2 py-2 whitespace-nowrap"></td>
                        <td
                            v-if="component.products.type != 'kitset'"
                            class="px-2 py-2 whitespace-nowrap"
                        >
                            {{
                                component.products.product_stock_levels.length
                                    ? component.products.product_stock_levels[0]
                                          .stock_available
                                    : 0
                            }}
                        </td>
                        <td v-else class="px-2 py-2 whitespace-nowrap"></td>
                        <td class="px-2 py-2 whitespace-nowrap">
                            {{
                                (
                                    component.quantity *
                                    component.products.weight *
                                    (country === 'us' ? 2.20462 : 1)
                                ).toFixed(1)
                            }}
                        </td>
                        <td class="px-2 py-2 whitespace-nowrap">
                            <button @click="removeComponent(component)">
                                Remove
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th
                            class="px-6 py-3 text-s font-medium whitespace-nowrap"
                        >
                            <slot name="currency-symbol"></slot
                            >{{
                                invoice.invoice_components
                                    .reduce(
                                        (acc, component) =>
                                            acc +
                                            component.price *
                                                component.quantity,
                                        0
                                    )
                                    .toFixed(2)
                            }}
                        </th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th
                            class="px-6 py-3 text-s font-medium whitespace-nowrap"
                            v-if="country === 'US'"
                        >
                            {{ (invoice.weight * 2.20462).toFixed(1) }}
                            <slot name="weight-unit"></slot>
                        </th>
                        <th
                            class="px-6 py-3 text-s font-medium whitespace-nowrap"
                            v-else
                        >
                            {{ weight_sum.toFixed(1) }}
                            <slot name="weight-unit"></slot>
                        </th>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</template>
