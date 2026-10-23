/* Hand-drawn, Excalidraw-style diagrams for slides.md.
 *
 * Write a diagram as a plain <svg class="sketch">. Once reveal.js is ready,
 * every rect, ellipse, circle, line and polyline inside it is redrawn with
 * rough.js (vendor/rough.js) so it looks sketched by hand. Text and icons
 * (<text>, <image>) are left as they are; custom.css gives the text a
 * handwritten font.
 *
 *   stroke / stroke-width / fill   used as given (fill="none" = outline only)
 *   rx                             rounded corners on a rect (default 12)
 *   data-fill="solid"              solid fill instead of hachure lines
 *   data-arrow                     arrowhead at the end of a line / polyline
 *   data-dash                      dashed outline
 *
 * Put fragment classes on a <g> around the shapes, never on a shape itself:
 * the shapes are replaced, the <g> stays.
 */
(function () {
	const CREAM = "#faf9f5";

	function num(el, name, fallback) {
		const v = parseFloat(el.getAttribute(name));
		return Number.isNaN(v) ? fallback : v;
	}

	function roundedRect(x, y, w, h, r) {
		r = Math.min(r, w / 2, h / 2);
		return (
			`M ${x + r} ${y} L ${x + w - r} ${y} Q ${x + w} ${y} ${x + w} ${y + r}` +
			` L ${x + w} ${y + h - r} Q ${x + w} ${y + h} ${x + w - r} ${y + h}` +
			` L ${x + r} ${y + h} Q ${x} ${y + h} ${x} ${y + h - r}` +
			` L ${x} ${y + r} Q ${x} ${y} ${x + r} ${y} Z`
		);
	}

	function points(el) {
		if (el.tagName === "line") {
			return [
				[num(el, "x1", 0), num(el, "y1", 0)],
				[num(el, "x2", 0), num(el, "y2", 0)],
			];
		}
		return el
			.getAttribute("points")
			.trim()
			.split(/[\s]+/)
			.map((p) => p.split(",").map(Number));
	}

	function options(el, seed) {
		const fill = el.getAttribute("fill");
		const o = {
			seed,
			roughness: 1.1,
			bowing: 1.2,
			stroke: el.getAttribute("stroke") || CREAM,
			strokeWidth: num(el, "stroke-width", 2),
			fillStyle: el.getAttribute("data-fill") || "hachure",
			fillWeight: 1.4,
			hachureGap: 7,
			hachureAngle: -41,
		};
		if (fill && fill !== "none") o.fill = fill;
		if (el.hasAttribute("data-dash")) o.strokeLineDash = [10, 8];
		return o;
	}

	function sketch(svg) {
		const rc = rough.svg(svg);
		let seed = 11;
		svg.querySelectorAll("rect, ellipse, circle, line, polyline").forEach((el) => {
			const o = options(el, seed++);
			let g;
			switch (el.tagName) {
				case "rect":
					g = rc.path(
						roundedRect(
							num(el, "x", 0),
							num(el, "y", 0),
							num(el, "width", 0),
							num(el, "height", 0),
							num(el, "rx", 12),
						),
						o,
					);
					break;
				case "ellipse":
					g = rc.ellipse(num(el, "cx", 0), num(el, "cy", 0), 2 * num(el, "rx", 0), 2 * num(el, "ry", 0), o);
					break;
				case "circle":
					g = rc.circle(num(el, "cx", 0), num(el, "cy", 0), 2 * num(el, "r", 0), o);
					break;
				default:
					g = rc.linearPath(points(el), o);
			}
			if (el.hasAttribute("data-arrow")) {
				const pts = points(el);
				const [tx, ty] = pts[pts.length - 1];
				const [fx, fy] = pts[pts.length - 2];
				const a = Math.atan2(ty - fy, tx - fx);
				const head = { ...o, fill: undefined, strokeLineDash: undefined };
				for (const side of [-0.45, 0.45]) {
					g.appendChild(
						rc.line(tx - 18 * Math.cos(a + side), ty - 18 * Math.sin(a + side), tx, ty, head),
					);
				}
			}
			el.replaceWith(g);
		});
	}

	window.sketchDiagrams = function () {
		document.querySelectorAll(".reveal svg.sketch").forEach(sketch);
	};
})();
