-- 商品表
CREATE TABLE products (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  category TEXT NOT NULL,
  price FLOAT NOT NULL,
  description TEXT DEFAULT '',
  image TEXT DEFAULT '',
  "isActive" BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 订单表
CREATE TABLE orders (
  id TEXT PRIMARY KEY,
  items JSONB NOT NULL,
  total FLOAT NOT NULL,
  status TEXT DEFAULT 'pending',
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 开启 RLS
ALTER TABLE products ENABLE ROW LEVEL SECURITY;
ALTER TABLE orders ENABLE ROW LEVEL SECURITY;

-- 允许任何人读取
CREATE POLICY "read_products" ON products FOR SELECT USING (true);
CREATE POLICY "read_orders" ON orders FOR SELECT USING (true);

-- 允许任何人写入（管理密码保护在网页UI层面）
CREATE POLICY "insert_products" ON products FOR INSERT WITH CHECK (true);
CREATE POLICY "update_products" ON products FOR UPDATE USING (true);
CREATE POLICY "delete_products" ON products FOR DELETE USING (true);
CREATE POLICY "insert_orders" ON orders FOR INSERT WITH CHECK (true);
CREATE POLICY "update_orders" ON orders FOR UPDATE USING (true);
