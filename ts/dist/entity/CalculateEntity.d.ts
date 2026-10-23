import { TaxCalculationEntityBase } from '../TaxCalculationEntityBase';
import type { TaxCalculationSDK } from '../TaxCalculationSDK';
import type { Control } from '../types';
import type { Calculate, CalculateLoadMatch, CalculateCreateData } from '../TaxCalculationTypes';
declare class CalculateEntity extends TaxCalculationEntityBase<Calculate> {
    constructor(client: TaxCalculationSDK, entopts: any);
    make(this: CalculateEntity): CalculateEntity;
    load(this: any, reqmatch?: CalculateLoadMatch, ctrl?: Control): Promise<CalculateEntity>;
    create(this: any, reqdata?: CalculateCreateData, ctrl?: Control): Promise<CalculateEntity>;
}
export { CalculateEntity };
