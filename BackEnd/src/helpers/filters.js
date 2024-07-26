const getData = async (limit, page, table) =>{
    const offset = (page-1)*limit;
    const options = {
        limit: limit,
        offset: offset
    }

    const result = await table.findAndCountAll(options)
    const pages = Math.ceil(result.count/limit);

    return {
        page: page,
        limit: limit,
        totalPages: pages,
        totalItems: result.count,
        result: result.rows
    }
}

export const filters = {
    getData
}