<script setup>
let quote = useState('quote');
let compTable = ref(null);
const country = useState('country');

const pricesInvalid = () => {
    return (
        quote.value.quote_components.length > 0 &&
        quote.value.quote_components.every((component) => {
            return (
                new Date(component.date) <=
                    new Date(new Date().setDate(new Date().getDate() - 30)) &&
                component.price ==
                    component.products[`${country.value}_retail_cost`]
            );
        })
    );
};

async function copyTable() {
    const tableHTML = compTable.value.outerHTML;
    await navigator.clipboard.write([
        new ClipboardItem({
            'text/html': new Blob([tableHTML], { type: 'text/html' }),
        }),
    ]);
}
</script>

<template>
    <p v-if="pricesInvalid()" class="text-red-500">
        The quoted prices are no longer valid - they were quoted on
        {{
            quote.quote_components
                .reduce((a, b) => {
                    return new Date(a.date) > new Date(b.date) ? a : b;
                })
                .date.split('T')[0]
                .split('-')
                .reverse()
                .join('/')
        }}
        and prices have since updated
    </p>
    <button class="button" v-else @click="copyTable">Copy Quote</button>
    <div style="width: 100%" class="invisible">
        <div style="display: inline-block">
            <div
                style="
                    box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.06);
                    border-bottom: 1px solid #cbd5e0;
                    border-radius: 0.375rem;
                "
            >
                <table
                    ref="compTable"
                    style="
                        width: auto;
                        border-collapse: collapse;
                        border: 1px solid #edf2f7;
                    "
                >
                    <thead style="background-color: #f9fafb">
                        <tr>
                            <th
                                style="
                                    padding: 0.75rem 1.5rem;
                                    text-align: left;
                                    font-size: 0.75rem;
                                    font-weight: 500;
                                    color: #6b7280;
                                    text-transform: uppercase;
                                    border: 1px solid #edf2f7;
                                "
                            >
                                Quote #{{ quote.id }}
                            </th>
                            <th style="color: #6b7280"></th>
                            <th style="color: #6b7280"></th>
                            <th style="color: #6b7280"></th>
                        </tr>
                        <tr>
                            <th
                                style="
                                    padding: 0.75rem 1.5rem;
                                    text-align: left;
                                    font-size: 0.75rem;
                                    font-weight: 500;
                                    color: #6b7280;
                                    text-transform: uppercase;
                                    border: 1px solid #edf2f7;
                                "
                            >
                                Product Name
                            </th>
                            <th
                                style="
                                    padding: 0.75rem 1.5rem;
                                    text-align: left;
                                    font-size: 0.75rem;
                                    font-weight: 500;
                                    color: #6b7280;
                                    text-transform: uppercase;
                                    border: 1px solid #edf2f7;
                                "
                            >
                                Qty
                            </th>
                            <th
                                style="
                                    padding: 0.75rem 1.5rem;
                                    text-align: left;
                                    font-size: 0.75rem;
                                    font-weight: 500;
                                    color: #6b7280;
                                    text-transform: uppercase;
                                    border: 1px solid #edf2f7;
                                "
                            >
                                Unit Price
                            </th>
                            <th
                                style="
                                    padding: 0.75rem 1.5rem;
                                    text-align: left;
                                    font-size: 0.75rem;
                                    font-weight: 500;
                                    color: #6b7280;
                                    text-transform: uppercase;
                                    border: 1px solid #edf2f7;
                                "
                            >
                                Subtotal
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="component in quote.quote_components">
                            <td
                                style="
                                    padding: 0.75rem 1.5rem;
                                    border: 1px solid #edf2f7;
                                    white-space: nowrap;
                                "
                            >
                                <slot name="name" v-bind="component"></slot>
                            </td>
                            <td
                                style="
                                    padding: 0.75rem 1.5rem;
                                    border: 1px solid #edf2f7;
                                "
                            >
                                {{ component.quantity }}
                            </td>
                            <td
                                style="
                                    padding: 0.75rem 1.5rem;
                                    border: 1px solid #edf2f7;
                                "
                            >
                                <slot name="currency-unit"></slot
                                >{{ component.price?.toFixed(2) }}
                            </td>
                            <td
                                style="
                                    padding: 0.75rem 1.5rem;
                                    border: 1px solid #edf2f7;
                                "
                            >
                                <slot name="currency-unit"></slot
                                >{{
                                    (
                                        component.quantity *
                                        component.price.toFixed(2)
                                    ).toFixed(2)
                                }}
                            </td>
                        </tr>
                        <tr style="background-color: #f9fafb">
                            <th></th>
                            <th></th>
                            <th></th>
                            <td
                                style="
                                    padding: 0.75rem 1.5rem;
                                    border: 1px solid #edf2f7;
                                    font-weight: bold;
                                "
                            >
                                <slot name="currency-unit"></slot
                                >{{ quote.price?.toFixed(2) }}
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</template>
