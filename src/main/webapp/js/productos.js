const productos = {
    promocional: [
        { img: 'promo1.jpg', nombre: 'COMBO DOS SALADO + 2M&M OL', descripcion: '1 Canchita Gigante (Salada) + 2 Bebida (32oz) + 2 M&Ms. *Sabor bebida y M&Ms sujeto a stock / canchita sin refill', precio: 30.00 },
        { img: 'promo2.jpg', nombre: 'COMBO DOS DULCE + 2M&M OL', descripcion: '1 Canchita Grande (Dulce) + 2 Bebida (32oz) + 2 M&Ms. *Sabor bebida y M&Ms sujeto a stock / canchita sin refill', precio: 20.00 },
        { img: 'promo3.jpg', nombre: 'COMBO DOS MIX + 2M&M OL', descripcion: '1 Canchita Gigante (Mix) + 2 Bebida (32oz) + 2 M&Ms. *Sabor bebida y M&Ms sujeto a stock / canchita sin refill ', precio: 35.00 },
        { img: 'promo4.jpg', nombre: 'COMBO UNO SALADO + M&M OL', descripcion: '1 Canchita Grande (Salada) + 1 Bebida (32oz) + 1 M&Ms. *Sabor bebida y M&Ms sujeto a stock / canchita sin refill', precio: 35.00 },
        { img: 'promo5.jpg', nombre: 'COMBO UNO DULCE + M&M OL', descripcion: '1 Canchita Grande (Dulce) + 1 Bebida (32oz) + 1 M&Ms. *Sabor bebida y M&Ms sujeto a stock / canchita sin refill', precio: 35.00 },
		{ img: 'promo6.jpg', nombre: 'COMBO 2 SALADO + 2 DUOMÁX OL', descripcion: '1 Canchita Gigante (Salado) + 2 Bebidas (32oz) + 2 DUOMÁX. *Sabor bebida sujeto a stock / canchita sin refill', precio: 30.00 }
    ],
    cancha: [
        { img: 'promo1.jpg', nombre: 'Promo 1', descripcion: 'Descripción promo 1', precio: 30.00 },
        { img: 'promo2.jpg', nombre: 'Promo 2', descripcion: 'Descripción promo 2', precio: 35.00 }
    ],
    combos: [
        { img: 'combo1.jpg', nombre: 'Combo Salado', descripcion: 'Canchita + Bebida', precio: 47.00 },
        { img: 'combo2.jpg', nombre: 'Combo Dulce', descripcion: 'Canchita + Gaseosa', precio: 40.00 }
    ],
    bebidas: [
        { img: 'bebida1.jpg', nombre: 'Gaseosa', descripcion: 'Bebida de 32oz', precio: 10.00 }
    ],
    golosinas: [
        { img: 'golosina1.jpg', nombre: 'Chocolates', descripcion: 'Bolsa de chocolates', precio: 12.00 }
    ]
};

// Objeto para mantener el seguimiento de las cantidades seleccionadas
const productosSeleccionados = {
    promocional: [],
    cancha: [],
    combos: [],
    bebidas: [],
    golosinas: []
};

let total = 0;
let cantidadTotalProductos = 0;

// Inicializar arrays de cantidades para cada categoría
Object.keys(productos).forEach(categoria => {
    productosSeleccionados[categoria] = new Array(productos[categoria].length).fill(0);
});

function mostrarProductos(categoria) {
    const container = document.getElementById('products-grid');
    container.innerHTML = "";

    productos[categoria].forEach((producto, index) => {
        const productCard = document.createElement("div");
        productCard.className = "product-card";

        // Usar la cantidad guardada para este producto
        const cantidadGuardada = productosSeleccionados[categoria][index];

        productCard.innerHTML = `
            <img src="${producto.img}" alt="${producto.nombre}" class="product-img">
            <h2>${producto.nombre}</h2>
            <p>${producto.descripcion}</p>
            <p class="price">S/${producto.precio.toFixed(2)}</p>
            <div class="quantity-selector">
                <button onclick="actualizarCantidad('${categoria}', ${index}, -1)">-</button>
                <span id="${categoria}-cantidad-${index}">${cantidadGuardada}</span>
                <button onclick="actualizarCantidad('${categoria}', ${index}, 1)">+</button>
            </div>
        `;

        container.appendChild(productCard);
    });
}

function actualizarCantidad(categoria, index, cambio) {
    const cantidadElemento = document.getElementById(`${categoria}-cantidad-${index}`);
    let cantidadActual = parseInt(cantidadElemento.textContent) || 0;
    
    // Calcular la nueva cantidad
    let nuevaCantidad = cantidadActual + cambio;
    nuevaCantidad = Math.max(0, nuevaCantidad);
    
    // Guardar la nueva cantidad en el seguimiento
    productosSeleccionados[categoria][index] = nuevaCantidad;
    
    // Actualizar la cantidad en el elemento
    cantidadElemento.textContent = nuevaCantidad;
    
    // Recalcular el total de productos y el precio total
    actualizarTotales();
}

function actualizarTotales() {
    total = 0;
    cantidadTotalProductos = 0;

    // Calcular totales de todos los productos seleccionados
    Object.keys(productosSeleccionados).forEach(categoria => {
        productosSeleccionados[categoria].forEach((cantidad, index) => {
            cantidadTotalProductos += cantidad;
            total += cantidad * productos[categoria][index].precio;
        });
    });

    // Actualizar o esconder la sección total
    const totalSection = document.getElementById("total-section");
    if (cantidadTotalProductos > 0) {
        // Si no existe la sección total, crearla
        if (!totalSection) {
            const newTotalSection = document.createElement('div');
            newTotalSection.className = 'total-section';
            newTotalSection.id = 'total-section';
            newTotalSection.innerHTML = `
                <p>Dulcería: <span id="cantidad-total">0</span></p>
                <p id="total-value">Total: S/0.00</p>
            `;
            document.body.appendChild(newTotalSection);
        }
        // Actualizar los valores
        document.getElementById("cantidad-total").textContent = cantidadTotalProductos;
        document.getElementById("total-value").textContent = `Total: S/${total.toFixed(2)}`;
        document.getElementById("total-section").style.display = 'block';
    } else {
        // Si existe la sección total, esconderla
        if (totalSection) {
            totalSection.style.display = 'none';
        }
    }

    // Mostrar u ocultar el botón Continuar
    const continuarBtn = document.getElementById("continuar-btn");
    if (continuarBtn) {
        continuarBtn.style.display = cantidadTotalProductos > 0 ? 'block' : 'none';
    }
}

function continuarCompra() {
    const totalValue = total.toFixed(2);
    window.location.href = `Pasarela_pago.jsp?total=${totalValue}`;
}

function showCategory(categoria) {
    const container = document.getElementById('products-grid');
    container.innerHTML = "";

    if (productos[categoria]) {
        mostrarProductos(categoria);
    } else {
        console.error(`Categoría ${categoria} no encontrada.`);
    }
}

// Mostrar productos promocionales al cargar
mostrarProductos('promocional');